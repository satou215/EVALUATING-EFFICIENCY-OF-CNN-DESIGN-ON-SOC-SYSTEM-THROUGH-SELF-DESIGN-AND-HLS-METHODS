
log_wave [get_objects -filter {type == in_port || type == out_port || type == inout_port || type == port} /apatb_CNN_top/AESL_inst_CNN/*]
set designtopgroup [add_wave_group "Design Top Signals"]
set coutputgroup [add_wave_group "C Outputs" -into $designtopgroup]
set return_group [add_wave_group return(wire) -into $coutputgroup]
add_wave /apatb_CNN_top/AESL_inst_CNN/OutModel_ap_vld -into $return_group -color #ffff00 -radix hex
add_wave /apatb_CNN_top/AESL_inst_CNN/OutModel -into $return_group -radix hex
set cinputgroup [add_wave_group "C Inputs" -into $designtopgroup]
set return_group [add_wave_group return(memory) -into $cinputgroup]
add_wave /apatb_CNN_top/AESL_inst_CNN/Weights_q1 -into $return_group -radix hex
add_wave /apatb_CNN_top/AESL_inst_CNN/Weights_ce1 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_CNN_top/AESL_inst_CNN/Weights_address1 -into $return_group -radix hex
add_wave /apatb_CNN_top/AESL_inst_CNN/Weights_q0 -into $return_group -radix hex
add_wave /apatb_CNN_top/AESL_inst_CNN/Weights_ce0 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_CNN_top/AESL_inst_CNN/Weights_address0 -into $return_group -radix hex
add_wave /apatb_CNN_top/AESL_inst_CNN/InModel_q0 -into $return_group -radix hex
add_wave /apatb_CNN_top/AESL_inst_CNN/InModel_ce0 -into $return_group -color #ffff00 -radix hex
add_wave /apatb_CNN_top/AESL_inst_CNN/InModel_address0 -into $return_group -radix hex
set blocksiggroup [add_wave_group "Block-level IO Handshake" -into $designtopgroup]
add_wave /apatb_CNN_top/AESL_inst_CNN/ap_start -into $blocksiggroup
add_wave /apatb_CNN_top/AESL_inst_CNN/ap_done -into $blocksiggroup
add_wave /apatb_CNN_top/AESL_inst_CNN/ap_idle -into $blocksiggroup
add_wave /apatb_CNN_top/AESL_inst_CNN/ap_ready -into $blocksiggroup
set resetgroup [add_wave_group "Reset" -into $designtopgroup]
add_wave /apatb_CNN_top/AESL_inst_CNN/ap_rst -into $resetgroup
set clockgroup [add_wave_group "Clock" -into $designtopgroup]
add_wave /apatb_CNN_top/AESL_inst_CNN/ap_clk -into $clockgroup
save_wave_config CNN.wcfg
run all

