#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_start", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_done", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_idle", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_ready", 1, hls_out, -1, "", "", 1),
	Port_Property("InModel_address0", 9, hls_out, 0, "ap_memory", "mem_address", 1),
	Port_Property("InModel_ce0", 1, hls_out, 0, "ap_memory", "mem_ce", 1),
	Port_Property("InModel_q0", 16, hls_in, 0, "ap_memory", "mem_dout", 1),
	Port_Property("OutModel", 16, hls_out, 1, "ap_vld", "out_data", 1),
	Port_Property("OutModel_ap_vld", 1, hls_out, 1, "ap_vld", "out_vld", 1),
	Port_Property("Weights_address0", 14, hls_out, 2, "ap_memory", "mem_address", 1),
	Port_Property("Weights_ce0", 1, hls_out, 2, "ap_memory", "mem_ce", 1),
	Port_Property("Weights_q0", 16, hls_in, 2, "ap_memory", "mem_dout", 1),
	Port_Property("Weights_address1", 14, hls_out, 2, "ap_memory", "MemPortADDR2", 1),
	Port_Property("Weights_ce1", 1, hls_out, 2, "ap_memory", "MemPortCE2", 1),
	Port_Property("Weights_q1", 16, hls_in, 2, "ap_memory", "MemPortDOUT2", 1),
};
const char* HLS_Design_Meta::dut_name = "CNN";
