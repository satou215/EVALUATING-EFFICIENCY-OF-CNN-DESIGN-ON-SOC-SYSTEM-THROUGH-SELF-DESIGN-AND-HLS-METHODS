
from tensorflow.keras.models import load_model
from keras_flops import get_flops
model = load_model(r"./h5Result/max_checkpoint1.h5")
# batch_size=1 (một forward pass)
flops = get_flops(model, batch_size=1)
print(f"FLOPs: {flops:,}")
print(f"GOPs: {flops / 1e9:.3f}")
