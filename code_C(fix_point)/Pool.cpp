#include <ap_axi_sdata.h>
typedef ap_fixed<16,8> fxp;
void Max_Pool1D_0(fxp input_MaxPooling[1280], fxp output_MaxPooling[640]){
	int PoolSize = 2;
	int stride= 2;
	int index = 0;
	loop_for_channel_pool_0:
	for (int z = 0; z < 4; z++){
		index = 0;
		loop_for_weight_pool_0:
		for (int y = 0; y < 160; y++){
			fxp max = -10;
			for (int j = 0; j < PoolSize; j++)
			{
				int pool_index = 320 * z + j + y * stride;
				fxp pool_value = input_MaxPooling[pool_index];
				if (pool_value > max) max=pool_value;
			}
			int out_index = 160 * z + index;
			output_MaxPooling[out_index]=max;
			index++;
		}
	}
}
void Max_Pool1D_1(fxp input_MaxPooling[1280], fxp output_MaxPooling[640]){
	int PoolSize = 2;
	int stride= 2;
	int index = 0;
	loop_for_channel_pool_1:
	for (int z = 0; z < 8; z++){
		index = 0;
		loop_for_weight_pool_1:
		for (int y = 0; y < 80; y++){
			fxp max = -10;
			for (int j = 0; j < PoolSize; j++)
			{
				int pool_index = 160 * z + j + y * stride;
				fxp pool_value = input_MaxPooling[pool_index];
				if (pool_value > max) max=pool_value;
			}
			int out_index = 80 * z + index;
			output_MaxPooling[out_index]=max;
			index++;
		}
	}
}
void Max_Pool1D_2(fxp input_MaxPooling[1280], fxp output_MaxPooling[640]){
	int PoolSize = 2;
	int stride= 2;
	int index = 0;
	loop_for_channel_pool_2:
	for (int z = 0; z < 16; z++){
		index = 0;
		loop_for_weight_pool_2:
		for (int y = 0; y < 40; y++){
			fxp max = -10;
			for (int j = 0; j < PoolSize; j++)
			{
				int pool_index = 80 * z + j + y * stride;
				fxp pool_value = input_MaxPooling[pool_index];
				if (pool_value > max) max=pool_value;
			}
			int out_index = 40 * z + index;
			output_MaxPooling[out_index]=max;
			index++;
		}
	}
}
void Max_Pool1D_3(fxp input_MaxPooling[1280], fxp output_MaxPooling[640]){
	int PoolSize = 2;
	int stride= 2;
	int index = 0;
	loop_for_channel_pool_3:
	for (int z = 0; z < 32; z++){
		index = 0;
		loop_for_weight_pool_3:
		for (int y = 0; y < 20; y++){
			fxp max = -10;
			for (int j = 0; j < PoolSize; j++)
			{
				int pool_index = 40 * z + j + y * stride;
				fxp pool_value = input_MaxPooling[pool_index];
				if (pool_value > max) max=pool_value;
			}
			int out_index = 20 * z + index;
			output_MaxPooling[out_index]=max;
			index++;
		}
	}
}
void GlobalAveragePool1D(fxp input_GlobalAveragePool1D[640],fxp output_GlobalAveragePool1D[32]){
	int hs = 0;
	for (int i = 0; i < 32; i++){
		fxp avg = 0;
		for (int j = 0; j < 20; j++){
			avg += input_GlobalAveragePool1D[20 * i + j];
		}
		output_GlobalAveragePool1D[hs] = avg / 20;
		hs++;
	}
}
