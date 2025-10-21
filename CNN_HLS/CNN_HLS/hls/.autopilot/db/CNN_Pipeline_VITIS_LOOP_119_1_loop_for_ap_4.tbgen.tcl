set moduleName CNN_Pipeline_VITIS_LOOP_119_1_loop_for_ap_4
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
set C_modelName {CNN_Pipeline_VITIS_LOOP_119_1_loop_for_ap_4}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict Weights { MEM_WIDTH 16 MEM_SIZE 22130 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict OutPadConv4 { MEM_WIDTH 16 MEM_SIZE 448 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict OutPadConv4_1 { MEM_WIDTH 16 MEM_SIZE 448 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict OutPadConv4_2 { MEM_WIDTH 16 MEM_SIZE 448 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict OutConv4 { MEM_WIDTH 16 MEM_SIZE 2560 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
set C_modelArgList {
	{ Weights int 16 regular {array 11065 { 1 1 } 1 1 }  }
	{ OutPadConv4 int 16 regular {array 224 { 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ OutPadConv4_1 int 16 regular {array 224 { 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ OutPadConv4_2 int 16 regular {array 224 { 1 1 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 1 1 }  }
	{ OutConv4 int 16 regular {array 1280 { 0 3 } 0 1 }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "Weights", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "OutPadConv4", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "OutPadConv4_1", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "OutPadConv4_2", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "OutConv4", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 34
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
	{ OutPadConv4_address0 sc_out sc_lv 8 signal 1 } 
	{ OutPadConv4_ce0 sc_out sc_logic 1 signal 1 } 
	{ OutPadConv4_q0 sc_in sc_lv 16 signal 1 } 
	{ OutPadConv4_address1 sc_out sc_lv 8 signal 1 } 
	{ OutPadConv4_ce1 sc_out sc_logic 1 signal 1 } 
	{ OutPadConv4_q1 sc_in sc_lv 16 signal 1 } 
	{ OutPadConv4_1_address0 sc_out sc_lv 8 signal 2 } 
	{ OutPadConv4_1_ce0 sc_out sc_logic 1 signal 2 } 
	{ OutPadConv4_1_q0 sc_in sc_lv 16 signal 2 } 
	{ OutPadConv4_1_address1 sc_out sc_lv 8 signal 2 } 
	{ OutPadConv4_1_ce1 sc_out sc_logic 1 signal 2 } 
	{ OutPadConv4_1_q1 sc_in sc_lv 16 signal 2 } 
	{ OutPadConv4_2_address0 sc_out sc_lv 8 signal 3 } 
	{ OutPadConv4_2_ce0 sc_out sc_logic 1 signal 3 } 
	{ OutPadConv4_2_q0 sc_in sc_lv 16 signal 3 } 
	{ OutPadConv4_2_address1 sc_out sc_lv 8 signal 3 } 
	{ OutPadConv4_2_ce1 sc_out sc_logic 1 signal 3 } 
	{ OutPadConv4_2_q1 sc_in sc_lv 16 signal 3 } 
	{ OutConv4_address0 sc_out sc_lv 11 signal 4 } 
	{ OutConv4_ce0 sc_out sc_logic 1 signal 4 } 
	{ OutConv4_we0 sc_out sc_logic 1 signal 4 } 
	{ OutConv4_d0 sc_out sc_lv 16 signal 4 } 
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
 	{ "name": "OutPadConv4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "OutPadConv4", "role": "address0" }} , 
 	{ "name": "OutPadConv4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutPadConv4", "role": "ce0" }} , 
 	{ "name": "OutPadConv4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "OutPadConv4", "role": "q0" }} , 
 	{ "name": "OutPadConv4_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "OutPadConv4", "role": "address1" }} , 
 	{ "name": "OutPadConv4_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutPadConv4", "role": "ce1" }} , 
 	{ "name": "OutPadConv4_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "OutPadConv4", "role": "q1" }} , 
 	{ "name": "OutPadConv4_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "OutPadConv4_1", "role": "address0" }} , 
 	{ "name": "OutPadConv4_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutPadConv4_1", "role": "ce0" }} , 
 	{ "name": "OutPadConv4_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "OutPadConv4_1", "role": "q0" }} , 
 	{ "name": "OutPadConv4_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "OutPadConv4_1", "role": "address1" }} , 
 	{ "name": "OutPadConv4_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutPadConv4_1", "role": "ce1" }} , 
 	{ "name": "OutPadConv4_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "OutPadConv4_1", "role": "q1" }} , 
 	{ "name": "OutPadConv4_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "OutPadConv4_2", "role": "address0" }} , 
 	{ "name": "OutPadConv4_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutPadConv4_2", "role": "ce0" }} , 
 	{ "name": "OutPadConv4_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "OutPadConv4_2", "role": "q0" }} , 
 	{ "name": "OutPadConv4_2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "OutPadConv4_2", "role": "address1" }} , 
 	{ "name": "OutPadConv4_2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutPadConv4_2", "role": "ce1" }} , 
 	{ "name": "OutPadConv4_2_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "OutPadConv4_2", "role": "q1" }} , 
 	{ "name": "OutConv4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "OutConv4", "role": "address0" }} , 
 	{ "name": "OutConv4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutConv4", "role": "ce0" }} , 
 	{ "name": "OutConv4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutConv4", "role": "we0" }} , 
 	{ "name": "OutConv4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "OutConv4", "role": "d0" }}  ]}

set ArgLastReadFirstWriteLatency {
	CNN_Pipeline_VITIS_LOOP_119_1_loop_for_ap_4 {
		Weights {Type I LastRead 41 FirstWrite -1}
		OutPadConv4 {Type I LastRead 21 FirstWrite -1}
		OutPadConv4_1 {Type I LastRead 21 FirstWrite -1}
		OutPadConv4_2 {Type I LastRead 21 FirstWrite -1}
		OutConv4 {Type O LastRead -1 FirstWrite 55}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "26916", "Max" : "26916"}
	, {"Name" : "Interval", "Min" : "26916", "Max" : "26916"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	Weights { ap_memory {  { Weights_address0 mem_address 1 14 }  { Weights_ce0 mem_ce 1 1 }  { Weights_q0 mem_dout 0 16 }  { Weights_address1 MemPortADDR2 1 14 }  { Weights_ce1 MemPortCE2 1 1 }  { Weights_q1 MemPortDOUT2 0 16 } } }
	OutPadConv4 { ap_memory {  { OutPadConv4_address0 mem_address 1 8 }  { OutPadConv4_ce0 mem_ce 1 1 }  { OutPadConv4_q0 mem_dout 0 16 }  { OutPadConv4_address1 MemPortADDR2 1 8 }  { OutPadConv4_ce1 MemPortCE2 1 1 }  { OutPadConv4_q1 MemPortDOUT2 0 16 } } }
	OutPadConv4_1 { ap_memory {  { OutPadConv4_1_address0 mem_address 1 8 }  { OutPadConv4_1_ce0 mem_ce 1 1 }  { OutPadConv4_1_q0 mem_dout 0 16 }  { OutPadConv4_1_address1 MemPortADDR2 1 8 }  { OutPadConv4_1_ce1 MemPortCE2 1 1 }  { OutPadConv4_1_q1 MemPortDOUT2 0 16 } } }
	OutPadConv4_2 { ap_memory {  { OutPadConv4_2_address0 mem_address 1 8 }  { OutPadConv4_2_ce0 mem_ce 1 1 }  { OutPadConv4_2_q0 mem_dout 0 16 }  { OutPadConv4_2_address1 MemPortADDR2 1 8 }  { OutPadConv4_2_ce1 MemPortCE2 1 1 }  { OutPadConv4_2_q1 MemPortDOUT2 0 16 } } }
	OutConv4 { ap_memory {  { OutConv4_address0 mem_address 1 11 }  { OutConv4_ce0 mem_ce 1 1 }  { OutConv4_we0 mem_we 1 1 }  { OutConv4_d0 mem_din 1 16 } } }
}
