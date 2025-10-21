set moduleName CNN_Pipeline_loop_for_channel_pool_1_loop_for_weight_pool_1
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
set C_modelName {CNN_Pipeline_loop_for_channel_pool_1_loop_for_weight_pool_1}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict OutConv3 { MEM_WIDTH 16 MEM_SIZE 2560 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict OutPool1 { MEM_WIDTH 16 MEM_SIZE 1280 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
set C_modelArgList {
	{ OutConv3 int 16 regular {array 1280 { 1 1 } 1 1 }  }
	{ OutPool1 int 16 regular {array 640 { 0 3 } 0 1 }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "OutConv3", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "OutPool1", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 16
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ OutConv3_address0 sc_out sc_lv 11 signal 0 } 
	{ OutConv3_ce0 sc_out sc_logic 1 signal 0 } 
	{ OutConv3_q0 sc_in sc_lv 16 signal 0 } 
	{ OutConv3_address1 sc_out sc_lv 11 signal 0 } 
	{ OutConv3_ce1 sc_out sc_logic 1 signal 0 } 
	{ OutConv3_q1 sc_in sc_lv 16 signal 0 } 
	{ OutPool1_address0 sc_out sc_lv 10 signal 1 } 
	{ OutPool1_ce0 sc_out sc_logic 1 signal 1 } 
	{ OutPool1_we0 sc_out sc_logic 1 signal 1 } 
	{ OutPool1_d0 sc_out sc_lv 16 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "OutConv3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "OutConv3", "role": "address0" }} , 
 	{ "name": "OutConv3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutConv3", "role": "ce0" }} , 
 	{ "name": "OutConv3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "OutConv3", "role": "q0" }} , 
 	{ "name": "OutConv3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "OutConv3", "role": "address1" }} , 
 	{ "name": "OutConv3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutConv3", "role": "ce1" }} , 
 	{ "name": "OutConv3_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "OutConv3", "role": "q1" }} , 
 	{ "name": "OutPool1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "OutPool1", "role": "address0" }} , 
 	{ "name": "OutPool1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutPool1", "role": "ce0" }} , 
 	{ "name": "OutPool1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutPool1", "role": "we0" }} , 
 	{ "name": "OutPool1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "OutPool1", "role": "d0" }}  ]}

set ArgLastReadFirstWriteLatency {
	CNN_Pipeline_loop_for_channel_pool_1_loop_for_weight_pool_1 {
		OutConv3 {Type I LastRead 1 FirstWrite -1}
		OutPool1 {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "642", "Max" : "642"}
	, {"Name" : "Interval", "Min" : "642", "Max" : "642"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	OutConv3 { ap_memory {  { OutConv3_address0 mem_address 1 11 }  { OutConv3_ce0 mem_ce 1 1 }  { OutConv3_q0 mem_dout 0 16 }  { OutConv3_address1 MemPortADDR2 1 11 }  { OutConv3_ce1 MemPortCE2 1 1 }  { OutConv3_q1 MemPortDOUT2 0 16 } } }
	OutPool1 { ap_memory {  { OutPool1_address0 mem_address 1 10 }  { OutPool1_ce0 mem_ce 1 1 }  { OutPool1_we0 mem_we 1 1 }  { OutPool1_d0 mem_din 1 16 } } }
}
