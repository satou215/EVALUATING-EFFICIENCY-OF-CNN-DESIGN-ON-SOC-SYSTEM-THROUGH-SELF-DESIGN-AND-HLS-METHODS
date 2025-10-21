from sklearn.model_selection import train_test_split
import pandas as pd
import numpy as np
from prepare import mit_bih_dataset



data_df = pd.read_csv('dataset.csv')
train_df, valtest_df = train_test_split( data_df, test_size=0.3,stratify=data_df['Label'], random_state=42)
test_df, val_df = train_test_split(valtest_df, test_size=0.5,stratify=valtest_df['Label'],  random_state=42)

train_df.to_csv('F:/Ky2nam3/do_an_1/code/mit_bih/train_test/train_data.csv', index=False, header=True)
val_df.to_csv('F:/Ky2nam3/do_an_1/code/mit_bih/train_test/val_data.csv', index=False, header=True)
test_df.to_csv('F:/Ky2nam3/do_an_1/code/mit_bih/train_test/test_data.csv', index=False, header=True)






