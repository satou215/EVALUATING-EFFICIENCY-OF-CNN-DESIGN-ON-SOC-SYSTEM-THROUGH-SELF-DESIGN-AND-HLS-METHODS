

import torch
import tqdm
import csv
import json

import numpy as np

from modeltest import CustomModel
from eval import evaluate_for_confusion
from util20 import get_loaders
from sklearn.metrics import classification_report, confusion_matrix, accuracy_score, precision_score, recall_score, f1_score, multilabel_confusion_matrix
from tensorflow.keras.models import load_model
from sklearn.preprocessing import label_binarize
if __name__ == '__main__':
    params = json.load(open('F:/Ky2nam3/do_an_1/code/mit_bih/config_PKT.json', 'r'))

    model_path = 'F:/Ky2nam3/do_an_1/code/mit_bih/h5Result/max_checkpoint1.h5'
    
    # Load the Keras model
    model = load_model(model_path)
    
    model.compile(optimizer='adam', loss='binary_crossentropy', metrics=['accuracy'])
    train_loader, val_loader, test_loader = get_loaders(params, True)
    # confusion_matrix = np.zeros((4, params['num_classes']))

    keras_model_results = []
    targets = []

    # Loop through test_loader
    for i, samples in enumerate(tqdm.tqdm(test_loader)):
        tensorData, _, labels, _ = samples
        bs, c, h, w = tensorData.shape
        x = tensorData.reshape(bs, c, h * w)
        x = np.transpose(x.numpy(), (0, 2, 1))
        # Predict using Keras model
        logits = model.predict(x) 
        keras_model_results.extend(logits)
        targets.extend(labels.numpy())  # Assuming labels is a torch tensor, convert to numpy array

    keras_model_results = np.array(keras_model_results)
    targets = np.array(targets)
    pred = np.array(np.array(keras_model_results) >= 0.5, dtype=float)
    target = targets.astype(int)
    pred = pred.astype(int)
    target_one_hot = label_binarize(target, classes=[0, 1, 2, 3, 4])
    pred_one_hot = label_binarize(pred, classes=[0, 1, 2, 3, 4])
    cm = multilabel_confusion_matrix(target_one_hot, pred_one_hot)
    print(classification_report(target, pred, target_names=["N", "L", "R", "V", "A"]))
    TP = cm[1, 1]
    TN = cm[0, 0]
    FP = cm[0, 1]
    FN = cm[1, 0]
    acc = accuracy_score(targets, pred)

    # Calculate precision
    ppv = precision_score(targets, pred, average='weighted')

    # Calculate recall
    sen = recall_score(targets, pred, average='weighted')

    # Calculate F1 score
    f1 = f1_score(targets, pred, average='weighted')
    spec = TN / (TN + FP)
    # Print results
    print("ACC:", acc)
    print("SEN:", sen)
    print("SPEC:", spec)
    print("PPV:", ppv)
    print("F1 Score:", f1)
