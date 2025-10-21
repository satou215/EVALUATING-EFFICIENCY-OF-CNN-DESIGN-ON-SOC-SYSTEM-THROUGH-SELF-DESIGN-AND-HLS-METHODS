import pandas as pd

# Danh sách các dòng dữ liệu
data = [
    "0000_8fc1acc0", "0001_0fc01b00", "0002_03ce2840", "0003_03ce0b00",
    "0004_43c2a850", "0005_83c32860", "0006_c3c3a870", "0007_4fc01900",
    "0008_03ce2880", "0009_03ce0900", "000a_43c2a890", "000b_83c328a0",
    "000c_c3c3a8b0", "000d_0fc01240", "000e_5ecf2dc0", "000f_5ec01b00",
    "0010_06de2880", "0011_06de0b00", "0012_46c6a890", "0013_86c728a0",
    "0014_c6c7a8b0", "0015_5ec01a00", "0016_06de2840", "0017_06de0a00",
    "0018_46c6a850", "0019_86c72860", "001a_c6c7a870", "001b_0fc01100",
    "001c_3e5eacc0", "001d_7e401b00", "001e_0e7e2840", "001f_0e7e0b00",
    "0020_4e4ea850", "0021_8e4f2860", "0022_ce4fa870", "0023_7e401900",
    "0024_0e7e2880", "0025_0e7e0900", "0026_4e4ea890", "0027_8e4f28a0",
    "0028_ce4fa8b0", "0029_0fc01200"
]

# Định nghĩa các trường bit: (tên, số lượng bit)
bit_fields = [
    ("Padding", 2),
    ("n", 5),
    ("y", 3),
    ("k", 5),
    ("j", 3),
    ("ALU_CFG_BITS", 3),
    ("stride", 1),
    ("Source_LDM", 2),
    ("Destinate_LDM", 2),
    ("Starting_Address_Store", 6)
]

# Hàm tách dữ liệu
def decode_binary(hex_str):
    binary_str = bin(int(hex_str, 16))[2:].zfill(32)
    values = {}
    idx = 0
    for name, size in bit_fields:
        values[name] = int(binary_str[idx:idx + size], 2)
        idx += size
    return values

# Chuyển dữ liệu thành bảng
rows = []
for entry in data:
    state, hex_val = entry.split('_')
    decoded = decode_binary(hex_val)
    decoded["State"] = int(state, 16)
    rows.append(decoded)



# Tạo DataFrame
df = pd.DataFrame(rows)
df = df[["State"] + [field[0] for field in bit_fields]]
df.head()

# Hàm để xử lý ALU_CFG_BITS và tạo cột mới
def process_alu_cfg_bits(bits):
    relu = (bits >> 2) & 0b1
    opcode_map = {
        0b00: "None",
        0b01: "MAC",
        0b10: "ADD",
        0b11: "MAX"
    }
    opcode = opcode_map[bits & 0b11]
    return relu, opcode

# Áp dụng lên DataFrame
df["ReLU"], df["Opcode"] = zip(*df["ALU_CFG_BITS"].apply(process_alu_cfg_bits))

# Bỏ cột ALU_CFG_BITS
df = df.drop(columns=["ALU_CFG_BITS"])

# Đặt lại thứ tự cột
cols = df.columns.tolist()
cols.insert(cols.index("stride"), cols.pop(cols.index("Opcode")))
cols.insert(cols.index("Opcode") + 1, cols.pop(cols.index("ReLU")))
df = df[cols]

df.head()

# Xuất DataFrame ra file Excel
output_path = "./decoded_states.xlsx"
df.to_excel(output_path, index=False)

output_path
