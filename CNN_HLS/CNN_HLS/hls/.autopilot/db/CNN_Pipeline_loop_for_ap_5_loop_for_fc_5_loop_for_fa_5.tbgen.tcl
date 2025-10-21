set moduleName CNN_Pipeline_loop_for_ap_5_loop_for_fc_5_loop_for_fa_5
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
set C_modelName {CNN_Pipeline_loop_for_ap_5_loop_for_fc_5_loop_for_fa_5}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict Weights { MEM_WIDTH 16 MEM_SIZE 22130 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict OutPadConv5 { MEM_WIDTH 16 MEM_SIZE 2688 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict OutConv5 { MEM_WIDTH 16 MEM_SIZE 2560 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
set C_modelArgList {
	{ p_cast105 int 11 regular  }
	{ Weights int 16 regular {array 11065 { 1 3 } 1 1 }  }
	{ OutPadConv5 int 16 regular {array 1344 { 1 3 } 1 1 }  }
	{ conv_i_i16_i86_i291 int 16 regular  }
	{ OutConv5 int 16 regular {array 1280 { 0 3 } 0 1 }  }
	{ Weights_load_130 int 16 regular  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "p_cast105", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "Weights", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "OutPadConv5", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "conv_i_i16_i86_i291", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "OutConv5", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "Weights_load_130", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 19
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ p_cast105 sc_in sc_lv 11 signal 0 } 
	{ Weights_address0 sc_out sc_lv 14 signal 1 } 
	{ Weights_ce0 sc_out sc_logic 1 signal 1 } 
	{ Weights_q0 sc_in sc_lv 16 signal 1 } 
	{ OutPadConv5_address0 sc_out sc_lv 11 signal 2 } 
	{ OutPadConv5_ce0 sc_out sc_logic 1 signal 2 } 
	{ OutPadConv5_q0 sc_in sc_lv 16 signal 2 } 
	{ conv_i_i16_i86_i291 sc_in sc_lv 16 signal 3 } 
	{ OutConv5_address0 sc_out sc_lv 11 signal 4 } 
	{ OutConv5_ce0 sc_out sc_logic 1 signal 4 } 
	{ OutConv5_we0 sc_out sc_logic 1 signal 4 } 
	{ OutConv5_d0 sc_out sc_lv 16 signal 4 } 
	{ Weights_load_130 sc_in sc_lv 16 signal 5 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "p_cast105", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "p_cast105", "role": "default" }} , 
 	{ "name": "Weights_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "Weights", "role": "address0" }} , 
 	{ "name": "Weights_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Weights", "role": "ce0" }} , 
 	{ "name": "Weights_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Weights", "role": "q0" }} , 
 	{ "name": "OutPadConv5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "OutPadConv5", "role": "address0" }} , 
 	{ "name": "OutPadConv5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutPadConv5", "role": "ce0" }} , 
 	{ "name": "OutPadConv5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "OutPadConv5", "role": "q0" }} , 
 	{ "name": "conv_i_i16_i86_i291", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "conv_i_i16_i86_i291", "role": "default" }} , 
 	{ "name": "OutConv5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "OutConv5", "role": "address0" }} , 
 	{ "name": "OutConv5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutConv5", "role": "ce0" }} , 
 	{ "name": "OutConv5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutConv5", "role": "we0" }} , 
 	{ "name": "OutConv5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "OutConv5", "role": "d0" }} , 
 	{ "name": "Weights_load_130", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Weights_load_130", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	CNN_Pipeline_loop_for_ap_5_loop_for_fc_5_loop_for_fa_5 {
		p_cast105 {Type I LastRead 0 FirstWrite -1}
		Weights {Type I LastRead 3 FirstWrite -1}
		OutPadConv5 {Type I LastRead 3 FirstWrite -1}
		conv_i_i16_i86_i291 {Type I LastRead 0 FirstWrite -1}
		OutConv5 {Type O LastRead -1 FirstWrite 7}
		Weights_load_130 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "6408", "Max" : "6408"}
	, {"Name" : "Interval", "Min" : "6408", "Max" : "6408"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	p_cast105 { ap_none {  { p_cast105 in_data 0 11 } } }
	Weights { ap_memory {  { Weights_address0 mem_address 1 14 }  { Weights_ce0 mem_ce 1 1 }  { Weights_q0 mem_dout 0 16 } } }
	OutPadConv5 { ap_memory {  { OutPadConv5_address0 mem_address 1 11 }  { OutPadConv5_ce0 mem_ce 1 1 }  { OutPadConv5_q0 mem_dout 0 16 } } }
	conv_i_i16_i86_i291 { ap_none {  { conv_i_i16_i86_i291 in_data 0 16 } } }
	OutConv5 { ap_memory {  { OutConv5_address0 mem_address 1 11 }  { OutConv5_ce0 mem_ce 1 1 }  { OutConv5_we0 mem_we 1 1 }  { OutConv5_d0 mem_din 1 16 } } }
	Weights_load_130 { ap_none {  { Weights_load_130 in_data 0 16 } } }
}
