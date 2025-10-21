set moduleName CNN_Pipeline_loop_for_a_Dense_1
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set isPipelined_legacy 1
set pipeline_type loop_auto_rewind
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
set C_modelName {CNN_Pipeline_loop_for_a_Dense_1}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict Weights { MEM_WIDTH 16 MEM_SIZE 22130 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict out_Dense { MEM_WIDTH 16 MEM_SIZE 10 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
set C_modelArgList {
	{ Weights int 16 regular {array 11065 { 1 1 } 1 1 }  }
	{ sext_ln21_2 int 16 regular  }
	{ sext_ln21_4 int 16 regular  }
	{ sext_ln21_6 int 16 regular  }
	{ sext_ln21_8 int 16 regular  }
	{ sext_ln21_10 int 16 regular  }
	{ sext_ln21_12 int 16 regular  }
	{ sext_ln21_14 int 16 regular  }
	{ sext_ln21_16 int 16 regular  }
	{ sext_ln21_18 int 16 regular  }
	{ sext_ln21_20 int 16 regular  }
	{ sext_ln21_22 int 16 regular  }
	{ sext_ln21_24 int 16 regular  }
	{ sext_ln21_26 int 16 regular  }
	{ sext_ln21_28 int 16 regular  }
	{ sext_ln21_30 int 16 regular  }
	{ sext_ln21_32 int 16 regular  }
	{ sext_ln21_34 int 16 regular  }
	{ sext_ln21_36 int 16 regular  }
	{ sext_ln21_38 int 16 regular  }
	{ sext_ln21_39 int 16 regular  }
	{ out_Dense int 16 regular {array 5 { 0 3 } 0 1 }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "Weights", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln21_2", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln21_4", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln21_6", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln21_8", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln21_10", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln21_12", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln21_14", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln21_16", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln21_18", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln21_20", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln21_22", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln21_24", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln21_26", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln21_28", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln21_30", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln21_32", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln21_34", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln21_36", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln21_38", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln21_39", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "out_Dense", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 36
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ Weights_address0 sc_out sc_lv 14 signal 0 } 
	{ Weights_ce0 sc_out sc_logic 1 signal 0 } 
	{ Weights_q0 sc_in sc_lv 16 signal 0 } 
	{ Weights_address1 sc_out sc_lv 14 signal 0 } 
	{ Weights_ce1 sc_out sc_logic 1 signal 0 } 
	{ Weights_q1 sc_in sc_lv 16 signal 0 } 
	{ sext_ln21_2 sc_in sc_lv 16 signal 1 } 
	{ sext_ln21_4 sc_in sc_lv 16 signal 2 } 
	{ sext_ln21_6 sc_in sc_lv 16 signal 3 } 
	{ sext_ln21_8 sc_in sc_lv 16 signal 4 } 
	{ sext_ln21_10 sc_in sc_lv 16 signal 5 } 
	{ sext_ln21_12 sc_in sc_lv 16 signal 6 } 
	{ sext_ln21_14 sc_in sc_lv 16 signal 7 } 
	{ sext_ln21_16 sc_in sc_lv 16 signal 8 } 
	{ sext_ln21_18 sc_in sc_lv 16 signal 9 } 
	{ sext_ln21_20 sc_in sc_lv 16 signal 10 } 
	{ sext_ln21_22 sc_in sc_lv 16 signal 11 } 
	{ sext_ln21_24 sc_in sc_lv 16 signal 12 } 
	{ sext_ln21_26 sc_in sc_lv 16 signal 13 } 
	{ sext_ln21_28 sc_in sc_lv 16 signal 14 } 
	{ sext_ln21_30 sc_in sc_lv 16 signal 15 } 
	{ sext_ln21_32 sc_in sc_lv 16 signal 16 } 
	{ sext_ln21_34 sc_in sc_lv 16 signal 17 } 
	{ sext_ln21_36 sc_in sc_lv 16 signal 18 } 
	{ sext_ln21_38 sc_in sc_lv 16 signal 19 } 
	{ sext_ln21_39 sc_in sc_lv 16 signal 20 } 
	{ out_Dense_address0 sc_out sc_lv 3 signal 21 } 
	{ out_Dense_ce0 sc_out sc_logic 1 signal 21 } 
	{ out_Dense_we0 sc_out sc_logic 1 signal 21 } 
	{ out_Dense_d0 sc_out sc_lv 16 signal 21 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "Weights_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "Weights", "role": "address0" }} , 
 	{ "name": "Weights_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Weights", "role": "ce0" }} , 
 	{ "name": "Weights_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Weights", "role": "q0" }} , 
 	{ "name": "Weights_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "Weights", "role": "address1" }} , 
 	{ "name": "Weights_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Weights", "role": "ce1" }} , 
 	{ "name": "Weights_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Weights", "role": "q1" }} , 
 	{ "name": "sext_ln21_2", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln21_2", "role": "default" }} , 
 	{ "name": "sext_ln21_4", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln21_4", "role": "default" }} , 
 	{ "name": "sext_ln21_6", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln21_6", "role": "default" }} , 
 	{ "name": "sext_ln21_8", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln21_8", "role": "default" }} , 
 	{ "name": "sext_ln21_10", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln21_10", "role": "default" }} , 
 	{ "name": "sext_ln21_12", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln21_12", "role": "default" }} , 
 	{ "name": "sext_ln21_14", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln21_14", "role": "default" }} , 
 	{ "name": "sext_ln21_16", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln21_16", "role": "default" }} , 
 	{ "name": "sext_ln21_18", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln21_18", "role": "default" }} , 
 	{ "name": "sext_ln21_20", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln21_20", "role": "default" }} , 
 	{ "name": "sext_ln21_22", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln21_22", "role": "default" }} , 
 	{ "name": "sext_ln21_24", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln21_24", "role": "default" }} , 
 	{ "name": "sext_ln21_26", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln21_26", "role": "default" }} , 
 	{ "name": "sext_ln21_28", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln21_28", "role": "default" }} , 
 	{ "name": "sext_ln21_30", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln21_30", "role": "default" }} , 
 	{ "name": "sext_ln21_32", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln21_32", "role": "default" }} , 
 	{ "name": "sext_ln21_34", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln21_34", "role": "default" }} , 
 	{ "name": "sext_ln21_36", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln21_36", "role": "default" }} , 
 	{ "name": "sext_ln21_38", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln21_38", "role": "default" }} , 
 	{ "name": "sext_ln21_39", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln21_39", "role": "default" }} , 
 	{ "name": "out_Dense_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "out_Dense", "role": "address0" }} , 
 	{ "name": "out_Dense_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_Dense", "role": "ce0" }} , 
 	{ "name": "out_Dense_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_Dense", "role": "we0" }} , 
 	{ "name": "out_Dense_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "out_Dense", "role": "d0" }}  ]}

set ArgLastReadFirstWriteLatency {
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
		out_Dense {Type O LastRead -1 FirstWrite 22}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "68", "Max" : "68"}
	, {"Name" : "Interval", "Min" : "68", "Max" : "68"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	Weights { ap_memory {  { Weights_address0 mem_address 1 14 }  { Weights_ce0 mem_ce 1 1 }  { Weights_q0 mem_dout 0 16 }  { Weights_address1 MemPortADDR2 1 14 }  { Weights_ce1 MemPortCE2 1 1 }  { Weights_q1 MemPortDOUT2 0 16 } } }
	sext_ln21_2 { ap_none {  { sext_ln21_2 in_data 0 16 } } }
	sext_ln21_4 { ap_none {  { sext_ln21_4 in_data 0 16 } } }
	sext_ln21_6 { ap_none {  { sext_ln21_6 in_data 0 16 } } }
	sext_ln21_8 { ap_none {  { sext_ln21_8 in_data 0 16 } } }
	sext_ln21_10 { ap_none {  { sext_ln21_10 in_data 0 16 } } }
	sext_ln21_12 { ap_none {  { sext_ln21_12 in_data 0 16 } } }
	sext_ln21_14 { ap_none {  { sext_ln21_14 in_data 0 16 } } }
	sext_ln21_16 { ap_none {  { sext_ln21_16 in_data 0 16 } } }
	sext_ln21_18 { ap_none {  { sext_ln21_18 in_data 0 16 } } }
	sext_ln21_20 { ap_none {  { sext_ln21_20 in_data 0 16 } } }
	sext_ln21_22 { ap_none {  { sext_ln21_22 in_data 0 16 } } }
	sext_ln21_24 { ap_none {  { sext_ln21_24 in_data 0 16 } } }
	sext_ln21_26 { ap_none {  { sext_ln21_26 in_data 0 16 } } }
	sext_ln21_28 { ap_none {  { sext_ln21_28 in_data 0 16 } } }
	sext_ln21_30 { ap_none {  { sext_ln21_30 in_data 0 16 } } }
	sext_ln21_32 { ap_none {  { sext_ln21_32 in_data 0 16 } } }
	sext_ln21_34 { ap_none {  { sext_ln21_34 in_data 0 16 } } }
	sext_ln21_36 { ap_none {  { sext_ln21_36 in_data 0 16 } } }
	sext_ln21_38 { ap_none {  { sext_ln21_38 in_data 0 16 } } }
	sext_ln21_39 { ap_none {  { sext_ln21_39 in_data 0 16 } } }
	out_Dense { ap_memory {  { out_Dense_address0 mem_address 1 3 }  { out_Dense_ce0 mem_ce 1 1 }  { out_Dense_we0 mem_we 1 1 }  { out_Dense_d0 mem_din 1 16 } } }
}
