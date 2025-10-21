set moduleName CNN_Pipeline_loop_for_3_channel_pad_4_loop_for_channel_pad_4
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
set C_modelName {CNN_Pipeline_loop_for_3_channel_pad_4_loop_for_channel_pad_4}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict OutPadConv4_2 { MEM_WIDTH 16 MEM_SIZE 448 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict OutPadConv4_1 { MEM_WIDTH 16 MEM_SIZE 448 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict OutPadConv4 { MEM_WIDTH 16 MEM_SIZE 448 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict OutPool1 { MEM_WIDTH 16 MEM_SIZE 1280 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ OutPadConv4_2 int 16 regular {array 224 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ OutPadConv4_1 int 16 regular {array 224 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ OutPadConv4 int 16 regular {array 224 { 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 } 0 1 }  }
	{ OutPool1 int 16 regular {array 640 { 1 3 } 1 1 }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "OutPadConv4_2", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "OutPadConv4_1", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "OutPadConv4", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "OutPool1", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 21
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ OutPadConv4_2_address0 sc_out sc_lv 8 signal 0 } 
	{ OutPadConv4_2_ce0 sc_out sc_logic 1 signal 0 } 
	{ OutPadConv4_2_we0 sc_out sc_logic 1 signal 0 } 
	{ OutPadConv4_2_d0 sc_out sc_lv 16 signal 0 } 
	{ OutPadConv4_1_address0 sc_out sc_lv 8 signal 1 } 
	{ OutPadConv4_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ OutPadConv4_1_we0 sc_out sc_logic 1 signal 1 } 
	{ OutPadConv4_1_d0 sc_out sc_lv 16 signal 1 } 
	{ OutPadConv4_address0 sc_out sc_lv 8 signal 2 } 
	{ OutPadConv4_ce0 sc_out sc_logic 1 signal 2 } 
	{ OutPadConv4_we0 sc_out sc_logic 1 signal 2 } 
	{ OutPadConv4_d0 sc_out sc_lv 16 signal 2 } 
	{ OutPool1_address0 sc_out sc_lv 10 signal 3 } 
	{ OutPool1_ce0 sc_out sc_logic 1 signal 3 } 
	{ OutPool1_q0 sc_in sc_lv 16 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "OutPadConv4_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "OutPadConv4_2", "role": "address0" }} , 
 	{ "name": "OutPadConv4_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutPadConv4_2", "role": "ce0" }} , 
 	{ "name": "OutPadConv4_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutPadConv4_2", "role": "we0" }} , 
 	{ "name": "OutPadConv4_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "OutPadConv4_2", "role": "d0" }} , 
 	{ "name": "OutPadConv4_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "OutPadConv4_1", "role": "address0" }} , 
 	{ "name": "OutPadConv4_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutPadConv4_1", "role": "ce0" }} , 
 	{ "name": "OutPadConv4_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutPadConv4_1", "role": "we0" }} , 
 	{ "name": "OutPadConv4_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "OutPadConv4_1", "role": "d0" }} , 
 	{ "name": "OutPadConv4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "OutPadConv4", "role": "address0" }} , 
 	{ "name": "OutPadConv4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutPadConv4", "role": "ce0" }} , 
 	{ "name": "OutPadConv4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutPadConv4", "role": "we0" }} , 
 	{ "name": "OutPadConv4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "OutPadConv4", "role": "d0" }} , 
 	{ "name": "OutPool1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "OutPool1", "role": "address0" }} , 
 	{ "name": "OutPool1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OutPool1", "role": "ce0" }} , 
 	{ "name": "OutPool1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "OutPool1", "role": "q0" }}  ]}

set ArgLastReadFirstWriteLatency {
	CNN_Pipeline_loop_for_3_channel_pad_4_loop_for_channel_pad_4 {
		OutPadConv4_2 {Type O LastRead -1 FirstWrite 10}
		OutPadConv4_1 {Type O LastRead -1 FirstWrite 10}
		OutPadConv4 {Type O LastRead -1 FirstWrite 10}
		OutPool1 {Type I LastRead 9 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "683", "Max" : "683"}
	, {"Name" : "Interval", "Min" : "683", "Max" : "683"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	OutPadConv4_2 { ap_memory {  { OutPadConv4_2_address0 mem_address 1 8 }  { OutPadConv4_2_ce0 mem_ce 1 1 }  { OutPadConv4_2_we0 mem_we 1 1 }  { OutPadConv4_2_d0 mem_din 1 16 } } }
	OutPadConv4_1 { ap_memory {  { OutPadConv4_1_address0 mem_address 1 8 }  { OutPadConv4_1_ce0 mem_ce 1 1 }  { OutPadConv4_1_we0 mem_we 1 1 }  { OutPadConv4_1_d0 mem_din 1 16 } } }
	OutPadConv4 { ap_memory {  { OutPadConv4_address0 mem_address 1 8 }  { OutPadConv4_ce0 mem_ce 1 1 }  { OutPadConv4_we0 mem_we 1 1 }  { OutPadConv4_d0 mem_din 1 16 } } }
	OutPool1 { ap_memory {  { OutPool1_address0 mem_address 1 10 }  { OutPool1_ce0 mem_ce 1 1 }  { OutPool1_q0 mem_dout 0 16 } } }
}
