set moduleName CNN
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set isPipelined_legacy 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 27
set C_modelName {CNN}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict InModel { MEM_WIDTH 16 MEM_SIZE 640 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict Weights { MEM_WIDTH 16 MEM_SIZE 22130 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ InModel int 16 regular {array 320 { 1 3 } 1 1 }  }
	{ OutModel int 16 regular {pointer 1}  }
	{ Weights int 16 regular {array 11065 { 1 1 } 1 1 }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "InModel", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "OutModel", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "Weights", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 17
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ InModel_address0 sc_out sc_lv 9 signal 0 } 
	{ InModel_ce0 sc_out sc_logic 1 signal 0 } 
	{ InModel_q0 sc_in sc_lv 16 signal 0 } 
	{ OutModel sc_out sc_lv 16 signal 1 } 
	{ OutModel_ap_vld sc_out sc_logic 1 outvld 1 } 
	{ Weights_address0 sc_out sc_lv 14 signal 2 } 
	{ Weights_ce0 sc_out sc_logic 1 signal 2 } 
	{ Weights_q0 sc_in sc_lv 16 signal 2 } 
	{ Weights_address1 sc_out sc_lv 14 signal 2 } 
	{ Weights_ce1 sc_out sc_logic 1 signal 2 } 
	{ Weights_q1 sc_in sc_lv 16 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "InModel_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "InModel", "role": "address0" }} , 
 	{ "name": "InModel_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "InModel", "role": "ce0" }} , 
 	{ "name": "InModel_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "InModel", "role": "q0" }} , 
 	{ "name": "OutModel", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "OutModel", "role": "default" }} , 
 	{ "name": "OutModel_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "OutModel", "role": "ap_vld" }} , 
 	{ "name": "Weights_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "Weights", "role": "address0" }} , 
 	{ "name": "Weights_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Weights", "role": "ce0" }} , 
 	{ "name": "Weights_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Weights", "role": "q0" }} , 
 	{ "name": "Weights_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "Weights", "role": "address1" }} , 
 	{ "name": "Weights_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Weights", "role": "ce1" }} , 
 	{ "name": "Weights_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Weights", "role": "q1" }}  ]}

set ArgLastReadFirstWriteLatency {
	CNN {
		InModel {Type I LastRead 0 FirstWrite -1}
		OutModel {Type O LastRead -1 FirstWrite 68}
		Weights {Type I LastRead 41 FirstWrite -1}}
	CNN_Pipeline_loop_for_channel_pad_0 {
		OutPadConv0 {Type O LastRead -1 FirstWrite 1}
		InModel {Type I LastRead 0 FirstWrite -1}}
	CNN_Pipeline_loop_for_3_channel_pad_1_loop_for_channel_pad_1 {
		OutPadConv1_2 {Type O LastRead -1 FirstWrite 12}
		OutPadConv1_1 {Type O LastRead -1 FirstWrite 12}
		OutPadConv1 {Type O LastRead -1 FirstWrite 12}
		OutConv0 {Type I LastRead 11 FirstWrite -1}}
	CNN_Pipeline_loop_for_ap_0 {
		OutPadConv0 {Type I LastRead 1 FirstWrite -1}
		sext_ln23_2 {Type I LastRead 0 FirstWrite -1}
		sext_ln23_4 {Type I LastRead 0 FirstWrite -1}
		sext_ln23_6 {Type I LastRead 0 FirstWrite -1}
		sext_ln23_8 {Type I LastRead 0 FirstWrite -1}
		sext_ln23_9 {Type I LastRead 0 FirstWrite -1}
		conv_i_i16_i86_i {Type I LastRead 0 FirstWrite -1}
		p_cast41_cast {Type I LastRead 0 FirstWrite -1}
		OutConv0 {Type O LastRead -1 FirstWrite 7}
		Weights_load {Type I LastRead 0 FirstWrite -1}}
	CNN_Pipeline_VITIS_LOOP_41_1_loop_for_ap_1 {
		Weights {Type I LastRead 32 FirstWrite -1}
		OutPadConv1 {Type I LastRead 11 FirstWrite -1}
		OutPadConv1_1 {Type I LastRead 11 FirstWrite -1}
		OutPadConv1_2 {Type I LastRead 11 FirstWrite -1}
		OutConv1 {Type O LastRead -1 FirstWrite 37}}
	CNN_Pipeline_loop_for_channel_pool_0_loop_for_weight_pool_0 {
		OutConv1 {Type I LastRead 1 FirstWrite -1}
		OutPool0 {Type O LastRead -1 FirstWrite 1}}
	CNN_Pipeline_loop_for_3_channel_pad_2_loop_for_channel_pad_2 {
		OutPadConv2_1 {Type O LastRead -1 FirstWrite 1}
		OutPadConv2 {Type O LastRead -1 FirstWrite 1}
		OutPool0 {Type I LastRead 0 FirstWrite -1}}
	CNN_Pipeline_VITIS_LOOP_67_1_loop_for_ap_2 {
		Weights {Type I LastRead 21 FirstWrite -1}
		OutPadConv2 {Type I LastRead 10 FirstWrite -1}
		OutPadConv2_1 {Type I LastRead 10 FirstWrite -1}
		OutConv2 {Type O LastRead -1 FirstWrite 22}}
	CNN_Pipeline_loop_for_3_channel_pad_3_loop_for_channel_pad_3 {
		OutPadConv3_2 {Type O LastRead -1 FirstWrite 11}
		OutPadConv3_1 {Type O LastRead -1 FirstWrite 11}
		OutPadConv3 {Type O LastRead -1 FirstWrite 11}
		OutConv2 {Type I LastRead 10 FirstWrite -1}}
	CNN_Pipeline_VITIS_LOOP_93_1_loop_for_ap_3 {
		Weights {Type I LastRead 41 FirstWrite -1}
		OutPadConv3 {Type I LastRead 21 FirstWrite -1}
		OutPadConv3_1 {Type I LastRead 21 FirstWrite -1}
		OutPadConv3_2 {Type I LastRead 21 FirstWrite -1}
		OutConv3 {Type O LastRead -1 FirstWrite 57}}
	CNN_Pipeline_loop_for_channel_pool_1_loop_for_weight_pool_1 {
		OutConv3 {Type I LastRead 1 FirstWrite -1}
		OutPool1 {Type O LastRead -1 FirstWrite 1}}
	CNN_Pipeline_loop_for_3_channel_pad_4_loop_for_channel_pad_4 {
		OutPadConv4_2 {Type O LastRead -1 FirstWrite 10}
		OutPadConv4_1 {Type O LastRead -1 FirstWrite 10}
		OutPadConv4 {Type O LastRead -1 FirstWrite 10}
		OutPool1 {Type I LastRead 9 FirstWrite -1}}
	CNN_Pipeline_VITIS_LOOP_119_1_loop_for_ap_4 {
		Weights {Type I LastRead 41 FirstWrite -1}
		OutPadConv4 {Type I LastRead 21 FirstWrite -1}
		OutPadConv4_1 {Type I LastRead 21 FirstWrite -1}
		OutPadConv4_2 {Type I LastRead 21 FirstWrite -1}
		OutConv4 {Type O LastRead -1 FirstWrite 55}}
	CNN_Pipeline_loop_for_3_channel_pad_5_loop_for_channel_pad_5 {
		OutPadConv5 {Type O LastRead -1 FirstWrite 3}
		OutConv4 {Type I LastRead 2 FirstWrite -1}}
	CNN_Pipeline_loop_for_channel_pool_2_loop_for_weight_pool_2 {
		OutConv5 {Type I LastRead 1 FirstWrite -1}
		OutPool2 {Type O LastRead -1 FirstWrite 1}}
	CNN_Pipeline_loop_for_ap_5_loop_for_fc_5_loop_for_fa_5 {
		p_cast105 {Type I LastRead 0 FirstWrite -1}
		Weights {Type I LastRead 3 FirstWrite -1}
		OutPadConv5 {Type I LastRead 3 FirstWrite -1}
		conv_i_i16_i86_i291 {Type I LastRead 0 FirstWrite -1}
		OutConv5 {Type O LastRead -1 FirstWrite 7}
		Weights_load_130 {Type I LastRead 0 FirstWrite -1}}
	CNN_Pipeline_loop_for_3_channel_pad_6_loop_for_channel_pad_6 {
		OutPadConv6 {Type O LastRead -1 FirstWrite 3}
		OutPool2 {Type I LastRead 2 FirstWrite -1}}
	CNN_Pipeline_loop_for_3_channel_pad_7_loop_for_channel_pad_7 {
		OutPadConv7 {Type O LastRead -1 FirstWrite 3}
		OutConv6 {Type I LastRead 2 FirstWrite -1}}
	CNN_Pipeline_loop_for_ap_6_loop_for_fc_6_loop_for_fa_6 {
		p_cast121 {Type I LastRead 0 FirstWrite -1}
		Weights {Type I LastRead 3 FirstWrite -1}
		OutPadConv6 {Type I LastRead 3 FirstWrite -1}
		conv_i_i16_i86_i373 {Type I LastRead 0 FirstWrite -1}
		mul_ln173 {Type I LastRead 0 FirstWrite -1}
		OutConv6 {Type O LastRead -1 FirstWrite 7}
		Weights_load_131 {Type I LastRead 0 FirstWrite -1}}
	CNN_Pipeline_loop_for_channel_pool_3_loop_for_weight_pool_3 {
		OutPool3_9 {Type O LastRead -1 FirstWrite 8}
		OutPool3_8 {Type O LastRead -1 FirstWrite 8}
		OutPool3_7 {Type O LastRead -1 FirstWrite 8}
		OutPool3_6 {Type O LastRead -1 FirstWrite 8}
		OutPool3_5 {Type O LastRead -1 FirstWrite 8}
		OutPool3_4 {Type O LastRead -1 FirstWrite 8}
		OutPool3_3 {Type O LastRead -1 FirstWrite 8}
		OutPool3_2 {Type O LastRead -1 FirstWrite 8}
		OutPool3_1 {Type O LastRead -1 FirstWrite 8}
		OutPool3 {Type O LastRead -1 FirstWrite 8}
		OutConv7 {Type I LastRead 8 FirstWrite -1}}
	CNN_Pipeline_loop_for_ap_7_loop_for_fc_7_loop_for_fa_7 {
		p_cast125 {Type I LastRead 0 FirstWrite -1}
		Weights {Type I LastRead 3 FirstWrite -1}
		OutPadConv7 {Type I LastRead 3 FirstWrite -1}
		conv_i_i16_i86_i437 {Type I LastRead 0 FirstWrite -1}
		mul_ln199 {Type I LastRead 0 FirstWrite -1}
		OutConv7 {Type O LastRead -1 FirstWrite 7}
		Weights_load_133 {Type I LastRead 0 FirstWrite -1}}
	CNN_Pipeline_VITIS_LOOP_93_1 {
		OutPool3 {Type I LastRead 1 FirstWrite -1}
		OutPool3_1 {Type I LastRead 1 FirstWrite -1}
		OutPool3_2 {Type I LastRead 1 FirstWrite -1}
		OutPool3_3 {Type I LastRead 1 FirstWrite -1}
		OutPool3_4 {Type I LastRead 1 FirstWrite -1}
		OutPool3_5 {Type I LastRead 1 FirstWrite -1}
		OutPool3_6 {Type I LastRead 1 FirstWrite -1}
		OutPool3_7 {Type I LastRead 1 FirstWrite -1}
		OutPool3_8 {Type I LastRead 1 FirstWrite -1}
		OutPool3_9 {Type I LastRead 1 FirstWrite -1}
		OutGlobalAverPool1D {Type O LastRead -1 FirstWrite 2}}
	CNN_Pipeline_loop_for_a_Dense_0 {
		Weights {Type I LastRead 33 FirstWrite -1}
		sext_ln9 {Type I LastRead 0 FirstWrite -1}
		sext_ln9_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln9_2 {Type I LastRead 0 FirstWrite -1}
		sext_ln9_3 {Type I LastRead 0 FirstWrite -1}
		sext_ln9_4 {Type I LastRead 0 FirstWrite -1}
		sext_ln9_5 {Type I LastRead 0 FirstWrite -1}
		sext_ln9_6 {Type I LastRead 0 FirstWrite -1}
		sext_ln9_7 {Type I LastRead 0 FirstWrite -1}
		sext_ln9_8 {Type I LastRead 0 FirstWrite -1}
		sext_ln9_9 {Type I LastRead 0 FirstWrite -1}
		sext_ln9_10 {Type I LastRead 0 FirstWrite -1}
		sext_ln9_11 {Type I LastRead 0 FirstWrite -1}
		sext_ln9_12 {Type I LastRead 0 FirstWrite -1}
		sext_ln9_13 {Type I LastRead 0 FirstWrite -1}
		sext_ln9_14 {Type I LastRead 0 FirstWrite -1}
		sext_ln9_15 {Type I LastRead 0 FirstWrite -1}
		sext_ln9_16 {Type I LastRead 0 FirstWrite -1}
		sext_ln9_17 {Type I LastRead 0 FirstWrite -1}
		sext_ln9_18 {Type I LastRead 0 FirstWrite -1}
		sext_ln9_19 {Type I LastRead 0 FirstWrite -1}
		sext_ln9_20 {Type I LastRead 0 FirstWrite -1}
		sext_ln9_21 {Type I LastRead 0 FirstWrite -1}
		sext_ln9_22 {Type I LastRead 0 FirstWrite -1}
		sext_ln9_23 {Type I LastRead 0 FirstWrite -1}
		sext_ln9_24 {Type I LastRead 0 FirstWrite -1}
		sext_ln9_25 {Type I LastRead 0 FirstWrite -1}
		sext_ln9_26 {Type I LastRead 0 FirstWrite -1}
		sext_ln9_27 {Type I LastRead 0 FirstWrite -1}
		sext_ln9_28 {Type I LastRead 0 FirstWrite -1}
		sext_ln9_29 {Type I LastRead 0 FirstWrite -1}
		sext_ln9_30 {Type I LastRead 0 FirstWrite -1}
		sext_ln9_31 {Type I LastRead 0 FirstWrite -1}
		OutDense0 {Type O LastRead -1 FirstWrite 34}}
	CNN_Pipeline_loop_for_a_Dense_1 {
		Weights {Type I LastRead 21 FirstWrite -1}
		sext_ln21_2 {Type I LastRead 0 FirstWrite -1}
		sext_ln21_4 {Type I LastRead 0 FirstWrite -1}
		sext_ln21_6 {Type I LastRead 0 FirstWrite -1}
		sext_ln21_8 {Type I LastRead 0 FirstWrite -1}
		sext_ln21_10 {Type I LastRead 0 FirstWrite -1}
		sext_ln21_12 {Type I LastRead 0 FirstWrite -1}
		sext_ln21_14 {Type I LastRead 0 FirstWrite -1}
		sext_ln21_16 {Type I LastRead 0 FirstWrite -1}
		sext_ln21_18 {Type I LastRead 0 FirstWrite -1}
		sext_ln21_20 {Type I LastRead 0 FirstWrite -1}
		sext_ln21_22 {Type I LastRead 0 FirstWrite -1}
		sext_ln21_24 {Type I LastRead 0 FirstWrite -1}
		sext_ln21_26 {Type I LastRead 0 FirstWrite -1}
		sext_ln21_28 {Type I LastRead 0 FirstWrite -1}
		sext_ln21_30 {Type I LastRead 0 FirstWrite -1}
		sext_ln21_32 {Type I LastRead 0 FirstWrite -1}
		sext_ln21_34 {Type I LastRead 0 FirstWrite -1}
		sext_ln21_36 {Type I LastRead 0 FirstWrite -1}
		sext_ln21_38 {Type I LastRead 0 FirstWrite -1}
		sext_ln21_39 {Type I LastRead 0 FirstWrite -1}
		out_Dense {Type O LastRead -1 FirstWrite 22}}
	CNN_Pipeline_loop_detect {
		maxindex {Type I LastRead 0 FirstWrite -1}
		out_Dense {Type I LastRead 0 FirstWrite -1}
		conv_i_i_i127_i_out {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "504806", "Max" : "504806"}
	, {"Name" : "Interval", "Min" : "504807", "Max" : "504807"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	InModel { ap_memory {  { InModel_address0 mem_address 1 9 }  { InModel_ce0 mem_ce 1 1 }  { InModel_q0 mem_dout 0 16 } } }
	OutModel { ap_vld {  { OutModel out_data 1 16 }  { OutModel_ap_vld out_vld 1 1 } } }
	Weights { ap_memory {  { Weights_address0 mem_address 1 14 }  { Weights_ce0 mem_ce 1 1 }  { Weights_q0 mem_dout 0 16 }  { Weights_address1 MemPortADDR2 1 14 }  { Weights_ce1 MemPortCE2 1 1 }  { Weights_q1 MemPortDOUT2 0 16 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
