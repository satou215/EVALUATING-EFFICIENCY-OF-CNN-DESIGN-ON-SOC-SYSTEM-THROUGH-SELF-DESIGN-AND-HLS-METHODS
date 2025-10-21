import os
os.environ['TF_ENABLE_ONEDNN_OPTS'] = '0'
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '1'
import wfdb
import json
import numpy as np
import pandas as pd
from tensorflow.keras.utils import Sequence

class RealDataset(Sequence):
    def __init__(self, length, waveform_dir, in_length, dataset, transform, in_channels, num_classes, dict_label, fs):
        self.dataset = dataset
        self.waveform_dir = waveform_dir
        self.in_length = in_length
        self.length = length
        self.transform = transform
        self.in_channels = in_channels
        self.num_classes = num_classes
        self.dict_label = dict_label
        self.fs = fs

    def __len__(self):
        return self.length

    def __getitem__(self, idx):
        if idx >= self.length:
            raise IndexError('Index out of bounds')
        if idx == 0:
            self.dataset = self.dataset.sample(frac=1).reset_index(drop=True)

        waveform, target, sample_id = self.get_waveform(idx)

        sample = {'waveform': waveform, 'id': sample_id, 'label': target}

        if self.transform:
            sample = self.transform(sample)

        return sample

    def get_waveform(self, idx):
        raw_signal, fields = wfdb.rdsamp(os.path.join(self.waveform_dir, self.dataset['filename_lr'][idx]))

        channel_idx = int(self.dataset['channel'][idx])
        start_idx = self.dataset['start'][idx]
        end_idx = self.dataset['end'][idx]
        raw_signal = raw_signal[start_idx:end_idx, channel_idx]
        waveform = np.array(raw_signal.T)
        waveform = np.nan_to_num(waveform)
        label = self.dataset['Label'][idx].split(',')
        target = np.zeros(self.num_classes)
        for lbl in label:
            target[self.dict_label[lbl]] = 1
        return waveform, target, idx
def one_hot_to_label(y_one_hot):
    return np.argmax(y_one_hot)

if __name__ == '__main__':
    x_test = []
    y_test = []
    y_test2 = []
    params = json.load(open('config_PKT.json', 'r')) 
    transform = None

    testset_df = pd.read_csv(params['test_labels_csv'])
    testset = RealDataset(len(testset_df), params['data_dir'], params['in_length'], testset_df, 
                          transform, in_channels=params['in_channels'], num_classes=params['num_classes'],
                          dict_label=params['dict_label'], fs=params['fs'])

    for i in range(len(testset)):
        sample = testset[i]
        x, y, idx = sample['waveform'], sample['label'], sample['id']
        x_test.append(x)
        y_test1 = one_hot_to_label(y)
        y_test.append(y_test1)
        print(i)
        #y_test2.append(y_test1)
        #print(i)
    x_test_padded = [np.pad(x, (0, 320 - len(x)),mode='constant', constant_values=0) if len(x) < 320 else x[:320] for x in x_test]
    x_test = np.array(x_test_padded)
    y_test = np.array(y_test)
    print(len(testset))
    print(x_test.shape)
    print(y_test)
    np.savetxt('signals3.txt', x_test,  fmt='%.18f')
    np.savetxt('labels3.txt', y_test,  fmt='%.d')
