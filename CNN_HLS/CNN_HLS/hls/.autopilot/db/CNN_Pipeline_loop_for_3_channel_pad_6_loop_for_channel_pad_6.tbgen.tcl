set moduleName CNN_Pipeline_loop_for_3_channel_pad_6_loop_for_channel_pad_6
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
set C_modelName {CNN_Pipeline_loop_for_3_channel_pad_6_loop_for_channel_pad_6}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict OutPadConv6 { MEM_WIDTH 16 MEM_SIZE 1408 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict OutPool2 { MEM_WIDTH 16 MEM_SIZE 1280 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ OutPadConv6 int 16 regular {array 704 { 0 3 } 0 1 }  }
	{ OutPool2 int 16 regular {array 640 { 1 3 } 1 1 }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "OutPadConv6", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "OutPool2", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 13
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ OutPadConv6_address0 sc_out sc_lv 10 signal 0 } 
	{ OutPadConv6_ce0 sc_out sc_logic 1 signal 0 } 
	{ OutPadConv6_we0 sc_out sc_logic 1 signal 0 } 
	{ OutPadConv6_d0 sc_out sc_lv 16 signal 0 } 
	{ OutPool2_address0 sc_out sc_lv 10 signal 1 } 
	{ OutPool2_ce0 sc_out sc_logic 1 signal 1 } 
	{ OutPool2_q0 sc_in sc_lv 16 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "OutPadConv6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "OutPadConv6", "role": "address0" }} , 
 	{ "name": "OutPadConv6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutPadConv6", "role": "ce0" }} , 
 	{ "name": "OutPadConv6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutPadConv6", "role": "we0" }} , 
 	{ "name": "OutPadConv6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "OutPadConv6", "role": "d0" }} , 
 	{ "name": "OutPool2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "OutPool2", "role": "address0" }} , 
 	{ "name": "OutPool2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutPool2", "role": "ce0" }} , 
 	{ "name": "OutPool2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "OutPool2", "role": "q0" }}  ]}

set ArgLastReadFirstWriteLatency {
	CNN_Pipeline_loop_for_3_channel_pad_6_loop_for_channel_pad_6 {
		OutPadConv6 {Type O LastRead -1 FirstWrite 3}
		OutPool2 {Type I LastRead 2 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "708", "Max" : "708"}
	, {"Name" : "Interval", "Min" : "708", "Max" : "708"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	OutPadConv6 { ap_memory {  { OutPadConv6_address0 mem_address 1 10 }  { OutPadConv6_ce0 mem_ce 1 1 }  { OutPadConv6_we0 mem_we 1 1 }  { OutPadConv6_d0 mem_din 1 16 } } }
	OutPool2 { ap_memory {  { OutPool2_address0 mem_address 1 10 }  { OutPool2_ce0 mem_ce 1 1 }  { OutPool2_q0 mem_dout 0 16 } } }
}
