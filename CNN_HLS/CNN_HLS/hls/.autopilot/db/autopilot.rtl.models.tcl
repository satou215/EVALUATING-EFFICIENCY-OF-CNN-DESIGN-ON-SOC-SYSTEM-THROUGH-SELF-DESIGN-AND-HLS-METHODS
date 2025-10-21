set SynModuleInfo {
  {SRCNAME CNN_Pipeline_loop_for_channel_pad_0 MODELNAME CNN_Pipeline_loop_for_channel_pad_0 RTLNAME CNN_CNN_Pipeline_loop_for_channel_pad_0
    SUBMODULES {
      {MODELNAME CNN_flow_control_loop_pipe_sequential_init RTLNAME CNN_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME CNN_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME CNN_Pipeline_loop_for_ap_0 MODELNAME CNN_Pipeline_loop_for_ap_0 RTLNAME CNN_CNN_Pipeline_loop_for_ap_0
    SUBMODULES {
      {MODELNAME CNN_mul_16s_16s_24_1_1 RTLNAME CNN_mul_16s_16s_24_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME CNN_mac_muladd_16s_16s_24ns_24_4_1 RTLNAME CNN_mac_muladd_16s_16s_24ns_24_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
    }
  }
  {SRCNAME CNN_Pipeline_loop_for_3_channel_pad_1_loop_for_channel_pad_1 MODELNAME CNN_Pipeline_loop_for_3_channel_pad_1_loop_for_channel_pad_1 RTLNAME CNN_CNN_Pipeline_loop_for_3_channel_pad_1_loop_for_channel_pad_1
    SUBMODULES {
      {MODELNAME CNN_urem_9ns_3ns_2_13_1 RTLNAME CNN_urem_9ns_3ns_2_13_1 BINDTYPE op TYPE urem IMPL auto LATENCY 12 ALLOW_PRAGMA 1}
      {MODELNAME CNN_mul_9ns_11ns_19_1_1 RTLNAME CNN_mul_9ns_11ns_19_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME CNN_mac_muladd_7ns_3ns_8ns_9_4_1 RTLNAME CNN_mac_muladd_7ns_3ns_8ns_9_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
    }
  }
  {SRCNAME CNN_Pipeline_VITIS_LOOP_41_1_loop_for_ap_1 MODELNAME CNN_Pipeline_VITIS_LOOP_41_1_loop_for_ap_1 RTLNAME CNN_CNN_Pipeline_VITIS_LOOP_41_1_loop_for_ap_1
    SUBMODULES {
      {MODELNAME CNN_mul_10ns_12ns_21_1_1 RTLNAME CNN_mul_10ns_12ns_21_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME CNN_sparsemux_7_2_16_1_1 RTLNAME CNN_sparsemux_7_2_16_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME CNN_am_addmul_9ns_9ns_11ns_21_4_1 RTLNAME CNN_am_addmul_9ns_9ns_11ns_21_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
      {MODELNAME CNN_am_addmul_9ns_10ns_12ns_23_4_1 RTLNAME CNN_am_addmul_9ns_10ns_12ns_23_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
    }
  }
  {SRCNAME CNN_Pipeline_loop_for_channel_pool_0_loop_for_weight_pool_0 MODELNAME CNN_Pipeline_loop_for_channel_pool_0_loop_for_weight_pool_0 RTLNAME CNN_CNN_Pipeline_loop_for_channel_pool_0_loop_for_weight_pool_0}
  {SRCNAME CNN_Pipeline_loop_for_3_channel_pad_2_loop_for_channel_pad_2 MODELNAME CNN_Pipeline_loop_for_3_channel_pad_2_loop_for_channel_pad_2 RTLNAME CNN_CNN_Pipeline_loop_for_3_channel_pad_2_loop_for_channel_pad_2
    SUBMODULES {
      {MODELNAME CNN_mul_3ns_8ns_8_1_1 RTLNAME CNN_mul_3ns_8ns_8_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME CNN_Pipeline_VITIS_LOOP_67_1_loop_for_ap_2 MODELNAME CNN_Pipeline_VITIS_LOOP_67_1_loop_for_ap_2 RTLNAME CNN_CNN_Pipeline_VITIS_LOOP_67_1_loop_for_ap_2}
  {SRCNAME CNN_Pipeline_loop_for_3_channel_pad_3_loop_for_channel_pad_3 MODELNAME CNN_Pipeline_loop_for_3_channel_pad_3_loop_for_channel_pad_3 RTLNAME CNN_CNN_Pipeline_loop_for_3_channel_pad_3_loop_for_channel_pad_3
    SUBMODULES {
      {MODELNAME CNN_urem_8ns_3ns_2_12_1 RTLNAME CNN_urem_8ns_3ns_2_12_1 BINDTYPE op TYPE urem IMPL auto LATENCY 11 ALLOW_PRAGMA 1}
      {MODELNAME CNN_mul_11ns_13ns_23_1_1 RTLNAME CNN_mul_11ns_13ns_23_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME CNN_mac_muladd_8ns_4ns_8ns_11_4_1 RTLNAME CNN_mac_muladd_8ns_4ns_8ns_11_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
    }
  }
  {SRCNAME CNN_Pipeline_VITIS_LOOP_93_1_loop_for_ap_3 MODELNAME CNN_Pipeline_VITIS_LOOP_93_1_loop_for_ap_3 RTLNAME CNN_CNN_Pipeline_VITIS_LOOP_93_1_loop_for_ap_3
    SUBMODULES {
      {MODELNAME CNN_mul_8ns_10ns_17_1_1 RTLNAME CNN_mul_8ns_10ns_17_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME CNN_am_addmul_8ns_8ns_10ns_19_4_1 RTLNAME CNN_am_addmul_8ns_8ns_10ns_19_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
      {MODELNAME CNN_am_addmul_8ns_9ns_11ns_21_4_1 RTLNAME CNN_am_addmul_8ns_9ns_11ns_21_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
      {MODELNAME CNN_am_addmul_8ns_10ns_12ns_23_4_1 RTLNAME CNN_am_addmul_8ns_10ns_12ns_23_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
    }
  }
  {SRCNAME CNN_Pipeline_loop_for_channel_pool_1_loop_for_weight_pool_1 MODELNAME CNN_Pipeline_loop_for_channel_pool_1_loop_for_weight_pool_1 RTLNAME CNN_CNN_Pipeline_loop_for_channel_pool_1_loop_for_weight_pool_1}
  {SRCNAME CNN_Pipeline_loop_for_3_channel_pad_4_loop_for_channel_pad_4 MODELNAME CNN_Pipeline_loop_for_3_channel_pad_4_loop_for_channel_pad_4 RTLNAME CNN_CNN_Pipeline_loop_for_3_channel_pad_4_loop_for_channel_pad_4
    SUBMODULES {
      {MODELNAME CNN_urem_7ns_3ns_2_11_1 RTLNAME CNN_urem_7ns_3ns_2_11_1 BINDTYPE op TYPE urem IMPL auto LATENCY 10 ALLOW_PRAGMA 1}
      {MODELNAME CNN_mul_7ns_9ns_15_1_1 RTLNAME CNN_mul_7ns_9ns_15_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME CNN_Pipeline_VITIS_LOOP_119_1_loop_for_ap_4 MODELNAME CNN_Pipeline_VITIS_LOOP_119_1_loop_for_ap_4 RTLNAME CNN_CNN_Pipeline_VITIS_LOOP_119_1_loop_for_ap_4
    SUBMODULES {
      {MODELNAME CNN_am_addmul_7ns_7ns_9ns_17_4_1 RTLNAME CNN_am_addmul_7ns_7ns_9ns_17_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
      {MODELNAME CNN_am_addmul_7ns_8ns_10ns_19_4_1 RTLNAME CNN_am_addmul_7ns_8ns_10ns_19_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
      {MODELNAME CNN_am_addmul_7ns_9ns_11ns_21_4_1 RTLNAME CNN_am_addmul_7ns_9ns_11ns_21_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
    }
  }
  {SRCNAME CNN_Pipeline_loop_for_3_channel_pad_5_loop_for_channel_pad_5 MODELNAME CNN_Pipeline_loop_for_3_channel_pad_5_loop_for_channel_pad_5 RTLNAME CNN_CNN_Pipeline_loop_for_3_channel_pad_5_loop_for_channel_pad_5
    SUBMODULES {
      {MODELNAME CNN_mac_muladd_7ns_5ns_7ns_11_4_1 RTLNAME CNN_mac_muladd_7ns_5ns_7ns_11_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
    }
  }
  {SRCNAME CNN_Pipeline_loop_for_ap_5_loop_for_fc_5_loop_for_fa_5 MODELNAME CNN_Pipeline_loop_for_ap_5_loop_for_fc_5_loop_for_fa_5 RTLNAME CNN_CNN_Pipeline_loop_for_ap_5_loop_for_fc_5_loop_for_fa_5}
  {SRCNAME CNN_Pipeline_loop_for_channel_pool_2_loop_for_weight_pool_2 MODELNAME CNN_Pipeline_loop_for_channel_pool_2_loop_for_weight_pool_2 RTLNAME CNN_CNN_Pipeline_loop_for_channel_pool_2_loop_for_weight_pool_2}
  {SRCNAME CNN_Pipeline_loop_for_3_channel_pad_6_loop_for_channel_pad_6 MODELNAME CNN_Pipeline_loop_for_3_channel_pad_6_loop_for_channel_pad_6 RTLNAME CNN_CNN_Pipeline_loop_for_3_channel_pad_6_loop_for_channel_pad_6
    SUBMODULES {
      {MODELNAME CNN_mac_muladd_6ns_5ns_6ns_10_4_1 RTLNAME CNN_mac_muladd_6ns_5ns_6ns_10_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
    }
  }
  {SRCNAME CNN_Pipeline_loop_for_ap_6_loop_for_fc_6_loop_for_fa_6 MODELNAME CNN_Pipeline_loop_for_ap_6_loop_for_fc_6_loop_for_fa_6 RTLNAME CNN_CNN_Pipeline_loop_for_ap_6_loop_for_fc_6_loop_for_fa_6}
  {SRCNAME CNN_Pipeline_loop_for_3_channel_pad_7_loop_for_channel_pad_7 MODELNAME CNN_Pipeline_loop_for_3_channel_pad_7_loop_for_channel_pad_7 RTLNAME CNN_CNN_Pipeline_loop_for_3_channel_pad_7_loop_for_channel_pad_7
    SUBMODULES {
      {MODELNAME CNN_mac_muladd_6ns_6ns_6ns_11_4_1 RTLNAME CNN_mac_muladd_6ns_6ns_6ns_11_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
    }
  }
  {SRCNAME CNN_Pipeline_loop_for_ap_7_loop_for_fc_7_loop_for_fa_7 MODELNAME CNN_Pipeline_loop_for_ap_7_loop_for_fc_7_loop_for_fa_7 RTLNAME CNN_CNN_Pipeline_loop_for_ap_7_loop_for_fc_7_loop_for_fa_7}
  {SRCNAME CNN_Pipeline_loop_for_channel_pool_3_loop_for_weight_pool_3 MODELNAME CNN_Pipeline_loop_for_channel_pool_3_loop_for_weight_pool_3 RTLNAME CNN_CNN_Pipeline_loop_for_channel_pool_3_loop_for_weight_pool_3
    SUBMODULES {
      {MODELNAME CNN_urem_5ns_5ns_4_9_1 RTLNAME CNN_urem_5ns_5ns_4_9_1 BINDTYPE op TYPE urem IMPL auto LATENCY 8 ALLOW_PRAGMA 1}
      {MODELNAME CNN_mul_5ns_7ns_11_1_1 RTLNAME CNN_mul_5ns_7ns_11_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME CNN_Pipeline_VITIS_LOOP_93_1 MODELNAME CNN_Pipeline_VITIS_LOOP_93_1 RTLNAME CNN_CNN_Pipeline_VITIS_LOOP_93_1
    SUBMODULES {
      {MODELNAME CNN_mul_16s_18ns_34_1_1 RTLNAME CNN_mul_16s_18ns_34_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME CNN_Pipeline_loop_for_a_Dense_0 MODELNAME CNN_Pipeline_loop_for_a_Dense_0 RTLNAME CNN_CNN_Pipeline_loop_for_a_Dense_0
    SUBMODULES {
      {MODELNAME CNN_mul_16s_12s_24_1_1 RTLNAME CNN_mul_16s_12s_24_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME CNN_mac_muladd_16s_12s_24ns_24_4_1 RTLNAME CNN_mac_muladd_16s_12s_24ns_24_4_1 BINDTYPE op TYPE all IMPL dsp_slice LATENCY 3}
    }
  }
  {SRCNAME CNN_Pipeline_loop_for_a_Dense_1 MODELNAME CNN_Pipeline_loop_for_a_Dense_1 RTLNAME CNN_CNN_Pipeline_loop_for_a_Dense_1}
  {SRCNAME CNN_Pipeline_loop_detect MODELNAME CNN_Pipeline_loop_detect RTLNAME CNN_CNN_Pipeline_loop_detect}
  {SRCNAME CNN MODELNAME CNN RTLNAME CNN IS_TOP 1
    SUBMODULES {
      {MODELNAME CNN_out_Dense_RAM_AUTO_1R1W RTLNAME CNN_out_Dense_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME CNN_OutPadConv0_RAM_1WNR_AUTO_1R1W RTLNAME CNN_OutPadConv0_RAM_1WNR_AUTO_1R1W BINDTYPE storage TYPE ram_1wnr IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME CNN_OutConv0_RAM_AUTO_1R1W RTLNAME CNN_OutConv0_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME CNN_OutPadConv1_RAM_1WNR_AUTO_1R1W RTLNAME CNN_OutPadConv1_RAM_1WNR_AUTO_1R1W BINDTYPE storage TYPE ram_1wnr IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME CNN_OutConv1_RAM_AUTO_1R1W RTLNAME CNN_OutConv1_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME CNN_OutPool0_RAM_AUTO_1R1W RTLNAME CNN_OutPool0_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME CNN_OutPadConv2_RAM_1WNR_AUTO_1R1W RTLNAME CNN_OutPadConv2_RAM_1WNR_AUTO_1R1W BINDTYPE storage TYPE ram_1wnr IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME CNN_OutPadConv3_RAM_1WNR_AUTO_1R1W RTLNAME CNN_OutPadConv3_RAM_1WNR_AUTO_1R1W BINDTYPE storage TYPE ram_1wnr IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME CNN_OutPadConv4_RAM_1WNR_AUTO_1R1W RTLNAME CNN_OutPadConv4_RAM_1WNR_AUTO_1R1W BINDTYPE storage TYPE ram_1wnr IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME CNN_OutPadConv5_RAM_AUTO_1R1W RTLNAME CNN_OutPadConv5_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME CNN_OutPadConv6_RAM_AUTO_1R1W RTLNAME CNN_OutPadConv6_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME CNN_OutPadConv7_RAM_AUTO_1R1W RTLNAME CNN_OutPadConv7_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME CNN_OutPool3_RAM_AUTO_1R1W RTLNAME CNN_OutPool3_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME CNN_OutGlobalAverPool1D_RAM_AUTO_1R1W RTLNAME CNN_OutGlobalAverPool1D_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME CNN_OutDense0_RAM_AUTO_1R1W RTLNAME CNN_OutDense0_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
