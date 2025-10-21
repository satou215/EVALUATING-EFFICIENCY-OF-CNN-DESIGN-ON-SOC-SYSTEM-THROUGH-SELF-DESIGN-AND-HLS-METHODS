import csv
import wfdb
import os
import numpy as np

def mit_bih_dataset(): 
    data_dir ='F:/Ky2nam3/do_an_1/code/mit_bih/dataset' 
    fileset = [file.split('.')[0] for file in os.listdir(data_dir) if file.endswith('.hea')]
    file_cutpoint = []
    length = 320
    channel_convert = {'MLII': 0, 'V2': 1}
    for file_name in fileset:
        if file_name in ['102', '104']:
            channel_name = 'V2'
        else:
            channel_name = 'MLII'
    

        record = wfdb.rdrecord(os.path.join(data_dir, file_name), channel_names=[channel_name])
        annotation = wfdb.rdann(os.path.join(data_dir, file_name), extension='atr')
        signal = record.p_signal[:, 0]

        # Normalize the signal
        signal = (signal - np.mean(signal)) / np.std(signal)

        label_annotation = []
        for label, symbol in enumerate(annotation.symbol):
            if symbol in ['N', 'A', 'V', 'L', 'R']:
                    label_annotation.append(label)
        for inx in label_annotation:
                sample = annotation.sample[inx]
                start_p = sample - int(160)
                end_p = sample + int(length/2)
                filename_lr = os.path.join(data_dir, file_name)
                channel_n = channel_convert[channel_name]
                file_cutpoint.append((filename_lr, start_p, end_p, channel_n, annotation.symbol[inx]))
    
    with open('dataset.csv', 'w', newline='') as newfile:
        writer = csv.writer(newfile)
        writer.writerow(['filename_lr','start','end', 'channel', 'Label'])
        for row in file_cutpoint[1:-1]:
            writer.writerow(row)
    
mit_bih_dataset()




    
