#include <ap_axi_sdata.h>
typedef ap_fixed<16,8> fxp;
void Max_Pool1D_0(fxp input_MaxPooling[1280], fxp output_MaxPooling[640]);
void Max_Pool1D_1(fxp input_MaxPooling[1280], fxp output_MaxPooling[640]);
void Max_Pool1D_2(fxp input_MaxPooling[1280], fxp output_MaxPooling[640]);
void Max_Pool1D_3(fxp input_MaxPooling[1280], fxp output_MaxPooling[640]);
void GlobalAveragePool1D(fxp input_GlobalAveragePool1D[640],fxp output_GlobalAveragePool1D[32]);
