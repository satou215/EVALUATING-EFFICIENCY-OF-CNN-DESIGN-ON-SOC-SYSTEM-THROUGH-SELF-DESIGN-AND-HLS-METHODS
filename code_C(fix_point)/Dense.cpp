#include <ap_axi_sdata.h>
typedef ap_fixed<16,8> fxp;
void Dense_0(fxp input_Dense[32],fxp output_Dense[20],fxp bias[20],fxp weight[640]){
	loop_for_a_Dense_0:
	for (int i = 0; i < 20; i++){
		fxp s=0;
		loop_for_b_Dense_0:
		for (int j = 0; j < 32; j++){
			s+=input_Dense[j]*weight[j*20+i];
		}
		if ((s+bias[i])<0) output_Dense[i]=0; else output_Dense[i]=s+bias[i];
	}
}
void Dense_1(fxp input_Dense[20],fxp &output_Dense,fxp bias[5],fxp weight[100]){
	fxp out_Dense[5];
	loop_for_a_Dense_1:
	for (int i = 0; i < 5; i++){
		fxp s=0;
		loop_for_b_Dense_1:
		for (int j = 0; j < 20; j++){
			s+=input_Dense[j]*weight[j*5+i];
		}
		out_Dense[i]=s+bias[i];
	}
	fxp maxindex=out_Dense[0];
	output_Dense = 0;
	loop_detect:
	for (int i=1; i<5; i++){
		if (out_Dense[i]>maxindex) {
			maxindex=out_Dense[i];
			output_Dense=i;
		}
	}
}
