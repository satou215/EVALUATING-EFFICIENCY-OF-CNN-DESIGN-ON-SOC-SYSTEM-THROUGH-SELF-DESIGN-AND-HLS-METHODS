from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import json

import torch
import torch.nn as nn
import torch.nn.functional as F
import torch.nn.init as init
from torchsummary import summary

class CustomModel(nn.Module):
    def __init__(self, in_length, in_channels, first_width, num_classes):
        super(CustomModel, self).__init__()
        self.block0 = nn.Sequential(
            nn.Conv1d(in_channels, first_width, kernel_size=5, stride=1, padding=2),
            nn.ReLU(),
            nn.Conv1d(first_width, first_width, kernel_size=5, stride=1,  padding=2),  
            nn.ReLU(),
            nn.MaxPool1d(2))
        self.block1 = nn.Sequential(
            nn.Conv1d(first_width, first_width * 2, kernel_size=5, stride=1, padding=2),  
            nn.ReLU(),
            nn.Conv1d(first_width * 2, first_width * 2, kernel_size=5, stride=1, padding=2),  
            nn.ReLU(),
            nn.MaxPool1d(2))
        self.block2 = nn.Sequential(
            nn.Conv1d(first_width * 2, first_width * 4, kernel_size=5, stride=1, padding=2),  
            nn.ReLU(),
            nn.Conv1d(first_width * 4, first_width * 4, kernel_size=5, stride=1, padding=2),  
            nn.ReLU(),
            nn.MaxPool1d(2))
        self.block3 = nn.Sequential(
            nn.Conv1d(first_width * 4, first_width * 8, kernel_size=5, stride=1, padding=2),
            nn.ReLU(),  
            nn.Conv1d(first_width * 8, first_width * 8, kernel_size=5, stride=1,  padding=2),  
            nn.ReLU(),
            nn.MaxPool1d(2),
            nn.AdaptiveAvgPool1d(1))
        self.classifer = nn.Sequential(
            nn.Linear(32, 20),
            nn.ReLU(),
            nn.Dropout(0.3),
            nn.Linear(20, num_classes))
        self.initialize_weights()

    def initialize_weights(self):
        for m in self.modules():
            if isinstance(m, nn.Conv1d) or isinstance(m, nn.Linear):
                init.kaiming_normal_(m.weight, mode='fan_out', nonlinearity='relu')

    def forward(self, x):
        x = self.block0(x)
        x = self.block1(x)
        x = self.block2(x)
        x = self.block3(x)
        x = x.view(x.size(0), -1)
        x = self.classifer(x)
        return x
if __name__ == '__main__':
    print(torch.cuda.is_available())
    params = json.load(open('config_PKT.json', 'r'))
    model = CustomModel(in_length=params['in_length'], 
                        in_channels=params['in_channels'],  
                        num_classes=params['num_classes'], 
                        first_width=params['first_width'])
    input = torch.randn(size=(1,1,320)) 
    output = model(input)
    model = model.to('cuda')
    print(output.shape)
    print(input.shape)
    summary(model, (params['in_channels'], params['in_length']))


