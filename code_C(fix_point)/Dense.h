#include <ap_axi_sdata.h>
typedef ap_fixed<16,8> fxp;
void Dense_0(fxp input_Dense[32],fxp output_Dense[20],fxp bias[20],fxp weight[640]);
void Dense_1(fxp input_Dense[20],fxp &output_Dense,fxp bias[5],fxp weight[100]);
