
import torch
import tqdm
import csv
import json

import numpy as np

#from ecgresnet import ECGResNet
from matplotlib import pyplot as plt
from modeltest import CustomModel
from eval import evaluate_for_confusion
from util20 import get_loaders

if __name__ == '__main__':
    device = 'cuda'
    params = json.load(open('config_PKT.json', 'r'))
    checkpoint = './training copy/max_checkpoint.pth'
    model = CustomModel(in_length=params['in_length'], 
                        in_channels=params['in_channels'],  
                        num_classes=params['num_classes'], 
                        first_width=params['first_width']).to(device)
    model.load_state_dict(torch.load(checkpoint)['model_state_dict'])
    model.eval()
    _, _, test_loader = get_loaders(params, True)
    confusion_matrix = np.zeros((4, params['num_classes']))
    for i, samples in enumerate(tqdm.tqdm(test_loader)):
        tensorData, _, labels, _ = samples
        bs, c, h, w = tensorData.shape
        x = tensorData.reshape(bs, c, h * w)
        logits = model(x.to(device))
        logits_ = logits.detach()
        logits_[logits_ >= 0.5] = 1
        logits_[logits_ < 0.5] = 0
        # print(logits_)
        sub_confusion_matrix = evaluate_for_confusion(np.array(labels.cpu()),
                                                      np.array(logits_.cpu()),
                                                      num_classes=params['num_classes'])
        confusion_matrix += sub_confusion_matrix
    with open('./results/log_test_cf9.csv', 'w') as f:
        writer = csv.writer(f)
        event_types = np.array(
            [''] + list(params['dict_label'].keys()))
        writer.writerow(event_types)
        for i in range(4):
            if i == 0:
                row = np.insert(confusion_matrix[i].astype(str), 0, 'TP')
            elif i == 1:
                row = np.insert(confusion_matrix[i].astype(str), 0, 'FN')
            elif i == 2:
                row = np.insert(confusion_matrix[i].astype(str), 0, 'FP')
            else:
                row = np.insert(confusion_matrix[i].astype(str), 0, 'TN')
            writer.writerow(row)
        ACC = np.nan_to_num(
                (confusion_matrix[0] + confusion_matrix[3]) / (confusion_matrix[0] + confusion_matrix[1]+ confusion_matrix[2]+ confusion_matrix[3]))
        SEN = np.nan_to_num(
                confusion_matrix[0] / (confusion_matrix[0] + confusion_matrix[1]))
        SPEC = np.nan_to_num(
            confusion_matrix[3]/ (confusion_matrix[2] + confusion_matrix[3]))
        PPV = np.nan_to_num(
                confusion_matrix[0] / (confusion_matrix[0] + confusion_matrix[2]))
        F1 = np.nan_to_num(2 * SEN * PPV / (SEN + PPV))
        ACC = np.append(ACC, np.mean(ACC))
        SEN = np.append(SEN, np.mean(SEN))
        SPEC = np.append(SPEC, np.mean(SPEC))
        PPV = np.append(PPV, np.mean(PPV))
        F1 = np.append(F1, np.mean(F1))
        writer.writerow(np.insert(ACC.astype(str), 0, 'ACC'))
        writer.writerow(np.insert(SEN.astype(str), 0, 'SEN'))
        writer.writerow(np.insert(SPEC.astype(str), 0, 'SPEC'))
        writer.writerow(np.insert(PPV.astype(str), 0, 'PPV'))
        writer.writerow(np.insert(F1.astype(str), 0, 'F1'))

        writer.writerow(np.array(['']))
    f.close()



