#include <ap_axi_sdata.h>
typedef ap_fixed<16,8> fxp;
void Padding_Conv1D_0(fxp input_Pad_Conv[320], fxp output_Pad_Conv[324]);
void Conv1D_0(fxp Input_Conv[324],fxp Output_Conv[1280], fxp bias[4], fxp kernel[20]);
void Padding_Conv1D_1(fxp input_Pad_Conv[1280], fxp output_Pad_Conv[1296]);
void Conv1D_1(fxp Input_Conv[1296],fxp Output_Conv[1280], fxp bias[4], fxp kernel[80]);
void Padding_Conv1D_2(fxp input_Pad_Conv[640], fxp output_Pad_Conv[656]);
void Conv1D_2(fxp Input_Conv[656],fxp Output_Conv[1280], fxp bias[8], fxp kernel[160]);
void Padding_Conv1D_3(fxp input_Pad_Conv[1280], fxp output_Pad_Conv[1312]);
void Conv1D_3(fxp Input_Conv[1312],fxp Output_Conv[1280], fxp bias[8], fxp kernel[320]);
void Padding_Conv1D_4(fxp input_Pad_Conv[640], fxp output_Pad_Conv[672]);
void Conv1D_4(fxp Input_Conv[672],fxp Output_Conv[1280], fxp bias[16], fxp kernel[640]);
void Padding_Conv1D_5(fxp input_Pad_Conv[1280], fxp output_Pad_Conv[1344]);
void Conv1D_5(fxp Input_Conv[1344],fxp Output_Conv[1280], fxp bias[16], fxp kernel[1280]);
void Padding_Conv1D_6(fxp input_Pad_Conv[640], fxp output_Pad_Conv[704]);
void Conv1D_6(fxp Input_Conv[704],fxp Output_Conv[1280], fxp bias[32], fxp kernel[2560]);
void Padding_Conv1D_7(fxp input_Pad_Conv[1280], fxp output_Pad_Conv[1408]);
void Conv1D_7(fxp Input_Conv[1408],fxp Output_Conv[1280], fxp bias[32], fxp kernel[5120]);
