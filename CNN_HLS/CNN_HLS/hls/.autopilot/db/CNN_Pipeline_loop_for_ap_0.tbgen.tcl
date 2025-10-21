set moduleName CNN_Pipeline_loop_for_ap_0
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
set C_modelName {CNN_Pipeline_loop_for_ap_0}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict OutPadConv0 { MEM_WIDTH 16 MEM_SIZE 648 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict OutConv0 { MEM_WIDTH 16 MEM_SIZE 2560 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
set C_modelArgList {
	{ OutPadConv0 int 16 regular {array 324 { 1 1 1 1 1 3 3 3 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ sext_ln23_2 int 16 regular  }
	{ sext_ln23_4 int 16 regular  }
	{ sext_ln23_6 int 16 regular  }
	{ sext_ln23_8 int 16 regular  }
	{ sext_ln23_9 int 16 regular  }
	{ conv_i_i16_i86_i int 16 regular  }
	{ p_cast41_cast int 10 regular  }
	{ OutConv0 int 16 regular {array 1280 { 0 3 } 0 1 }  }
	{ Weights_load int 16 regular  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "OutPadConv0", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln23_2", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln23_4", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln23_6", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln23_8", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln23_9", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "conv_i_i16_i86_i", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "p_cast41_cast", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "OutConv0", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "Weights_load", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 33
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ OutPadConv0_address0 sc_out sc_lv 9 signal 0 } 
	{ OutPadConv0_ce0 sc_out sc_logic 1 signal 0 } 
	{ OutPadConv0_q0 sc_in sc_lv 16 signal 0 } 
	{ OutPadConv0_address1 sc_out sc_lv 9 signal 0 } 
	{ OutPadConv0_ce1 sc_out sc_logic 1 signal 0 } 
	{ OutPadConv0_q1 sc_in sc_lv 16 signal 0 } 
	{ OutPadConv0_address2 sc_out sc_lv 9 signal 0 } 
	{ OutPadConv0_ce2 sc_out sc_logic 1 signal 0 } 
	{ OutPadConv0_q2 sc_in sc_lv 16 signal 0 } 
	{ OutPadConv0_address3 sc_out sc_lv 9 signal 0 } 
	{ OutPadConv0_ce3 sc_out sc_logic 1 signal 0 } 
	{ OutPadConv0_q3 sc_in sc_lv 16 signal 0 } 
	{ OutPadConv0_address4 sc_out sc_lv 9 signal 0 } 
	{ OutPadConv0_ce4 sc_out sc_logic 1 signal 0 } 
	{ OutPadConv0_q4 sc_in sc_lv 16 signal 0 } 
	{ sext_ln23_2 sc_in sc_lv 16 signal 1 } 
	{ sext_ln23_4 sc_in sc_lv 16 signal 2 } 
	{ sext_ln23_6 sc_in sc_lv 16 signal 3 } 
	{ sext_ln23_8 sc_in sc_lv 16 signal 4 } 
	{ sext_ln23_9 sc_in sc_lv 16 signal 5 } 
	{ conv_i_i16_i86_i sc_in sc_lv 16 signal 6 } 
	{ p_cast41_cast sc_in sc_lv 10 signal 7 } 
	{ OutConv0_address0 sc_out sc_lv 11 signal 8 } 
	{ OutConv0_ce0 sc_out sc_logic 1 signal 8 } 
	{ OutConv0_we0 sc_out sc_logic 1 signal 8 } 
	{ OutConv0_d0 sc_out sc_lv 16 signal 8 } 
	{ Weights_load sc_in sc_lv 16 signal 9 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "OutPadConv0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "OutPadConv0", "role": "address0" }} , 
 	{ "name": "OutPadConv0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutPadConv0", "role": "ce0" }} , 
 	{ "name": "OutPadConv0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "OutPadConv0", "role": "q0" }} , 
 	{ "name": "OutPadConv0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "OutPadConv0", "role": "address1" }} , 
 	{ "name": "OutPadConv0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutPadConv0", "role": "ce1" }} , 
 	{ "name": "OutPadConv0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "OutPadConv0", "role": "q1" }} , 
 	{ "name": "OutPadConv0_address2", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "OutPadConv0", "role": "address2" }} , 
 	{ "name": "OutPadConv0_ce2", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutPadConv0", "role": "ce2" }} , 
 	{ "name": "OutPadConv0_q2", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "OutPadConv0", "role": "q2" }} , 
 	{ "name": "OutPadConv0_address3", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "OutPadConv0", "role": "address3" }} , 
 	{ "name": "OutPadConv0_ce3", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutPadConv0", "role": "ce3" }} , 
 	{ "name": "OutPadConv0_q3", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "OutPadConv0", "role": "q3" }} , 
 	{ "name": "OutPadConv0_address4", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "OutPadConv0", "role": "address4" }} , 
 	{ "name": "OutPadConv0_ce4", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutPadConv0", "role": "ce4" }} , 
 	{ "name": "OutPadConv0_q4", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "OutPadConv0", "role": "q4" }} , 
 	{ "name": "sext_ln23_2", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln23_2", "role": "default" }} , 
 	{ "name": "sext_ln23_4", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln23_4", "role": "default" }} , 
 	{ "name": "sext_ln23_6", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln23_6", "role": "default" }} , 
 	{ "name": "sext_ln23_8", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln23_8", "role": "default" }} , 
 	{ "name": "sext_ln23_9", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sext_ln23_9", "role": "default" }} , 
 	{ "name": "conv_i_i16_i86_i", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "conv_i_i16_i86_i", "role": "default" }} , 
 	{ "name": "p_cast41_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "p_cast41_cast", "role": "default" }} , 
 	{ "name": "OutConv0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "OutConv0", "role": "address0" }} , 
 	{ "name": "OutConv0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutConv0", "role": "ce0" }} , 
 	{ "name": "OutConv0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutConv0", "role": "we0" }} , 
 	{ "name": "OutConv0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "OutConv0", "role": "d0" }} , 
 	{ "name": "Weights_load", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "Weights_load", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
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
		Weights_load {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "328", "Max" : "328"}
	, {"Name" : "Interval", "Min" : "328", "Max" : "328"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	OutPadConv0 { ap_memory {  { OutPadConv0_address0 mem_address 1 9 }  { OutPadConv0_ce0 mem_ce 1 1 }  { OutPadConv0_q0 mem_dout 0 16 }  { OutPadConv0_address1 MemPortADDR2 1 9 }  { OutPadConv0_ce1 MemPortCE2 1 1 }  { OutPadConv0_q1 MemPortDOUT2 0 16 }  { OutPadConv0_address2 MemPortADDR2 1 9 }  { OutPadConv0_ce2 MemPortCE2 1 1 }  { OutPadConv0_q2 MemPortDOUT2 0 16 }  { OutPadConv0_address3 MemPortADDR2 1 9 }  { OutPadConv0_ce3 MemPortCE2 1 1 }  { OutPadConv0_q3 MemPortDOUT2 0 16 }  { OutPadConv0_address4 MemPortADDR2 1 9 }  { OutPadConv0_ce4 MemPortCE2 1 1 }  { OutPadConv0_q4 MemPortDOUT2 0 16 } } }
	sext_ln23_2 { ap_none {  { sext_ln23_2 in_data 0 16 } } }
	sext_ln23_4 { ap_none {  { sext_ln23_4 in_data 0 16 } } }
	sext_ln23_6 { ap_none {  { sext_ln23_6 in_data 0 16 } } }
	sext_ln23_8 { ap_none {  { sext_ln23_8 in_data 0 16 } } }
	sext_ln23_9 { ap_none {  { sext_ln23_9 in_data 0 16 } } }
	conv_i_i16_i86_i { ap_none {  { conv_i_i16_i86_i in_data 0 16 } } }
	p_cast41_cast { ap_none {  { p_cast41_cast in_data 0 10 } } }
	OutConv0 { ap_memory {  { OutConv0_address0 mem_address 1 11 }  { OutConv0_ce0 mem_ce 1 1 }  { OutConv0_we0 mem_we 1 1 }  { OutConv0_d0 mem_din 1 16 } } }
	Weights_load { ap_none {  { Weights_load in_data 0 16 } } }
}
