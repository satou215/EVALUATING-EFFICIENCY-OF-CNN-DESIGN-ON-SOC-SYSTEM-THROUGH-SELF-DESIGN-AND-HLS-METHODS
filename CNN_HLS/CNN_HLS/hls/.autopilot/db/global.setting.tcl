
set TopModule "CNN"
set ClockPeriod 10
set ClockList ap_clk
set AxiliteClockList {}
set HasVivadoClockPeriod 0
set CombLogicFlag 0
set PipelineFlag 0
set DataflowTaskPipelineFlag 1
set TrivialPipelineFlag 0
set noPortSwitchingFlag 0
set FloatingPointFlag 0
set FftOrFirFlag 0
set NbRWValue 0
set intNbAccess 0
set NewDSPMapping 1
set HasDSPModule 1
set ResetLevelFlag 1
set ResetStyle control
set ResetSyncFlag 1
set ResetRegisterFlag 0
set ResetVariableFlag 0
set ResetRegisterNum 0
set FsmEncStyle onehot
set MaxFanout 0
set RtlPrefix {}
set RtlSubPrefix CNN_
set ExtraCCFlags {}
set ExtraCLdFlags {}
set SynCheckOptions {}
set PresynOptions {}
set PreprocOptions {}
set SchedOptions {}
set BindOptions {}
set RtlGenOptions {}
set RtlWriterOptions {}
set CbcGenFlag {}
set CasGenFlag {}
set CasMonitorFlag {}
set AutoSimOptions {}
set ExportMCPathFlag 0
set SCTraceFileName mytrace
set SCTraceFileFormat vcd
set SCTraceOption all
set TargetInfo xck26:-sfvc784:-2LV-c
set SourceFiles {sc {} c {D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/Pool.cpp D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/Dense.cpp D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/Conv.cpp D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/CNN.cpp}}
set SourceFlags {sc {} c {{} {} {} {}}}
set DirectiveFile {}
set TBFiles {verilog {D:/Verilog/signals_N_label_hex.txt D:/Verilog/signals_label_V_hex.txt D:/Verilog/signals_label_R_hex.txt D:/Verilog/signals_label_N_hex.txt D:/Verilog/signals_label_L_hex.txt D:/Verilog/signals_label_A_hex.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/signals2.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/signals1.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/output.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/outPE.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/labels2.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/labels1.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/Float_Weights.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/CNN_tb.cpp} bc {D:/Verilog/signals_N_label_hex.txt D:/Verilog/signals_label_V_hex.txt D:/Verilog/signals_label_R_hex.txt D:/Verilog/signals_label_N_hex.txt D:/Verilog/signals_label_L_hex.txt D:/Verilog/signals_label_A_hex.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/signals2.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/signals1.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/output.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/outPE.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/labels2.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/labels1.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/Float_Weights.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/CNN_tb.cpp} sc {D:/Verilog/signals_N_label_hex.txt D:/Verilog/signals_label_V_hex.txt D:/Verilog/signals_label_R_hex.txt D:/Verilog/signals_label_N_hex.txt D:/Verilog/signals_label_L_hex.txt D:/Verilog/signals_label_A_hex.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/signals2.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/signals1.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/output.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/outPE.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/labels2.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/labels1.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/Float_Weights.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/CNN_tb.cpp} vhdl {D:/Verilog/signals_N_label_hex.txt D:/Verilog/signals_label_V_hex.txt D:/Verilog/signals_label_R_hex.txt D:/Verilog/signals_label_N_hex.txt D:/Verilog/signals_label_L_hex.txt D:/Verilog/signals_label_A_hex.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/signals2.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/signals1.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/output.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/outPE.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/labels2.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/labels1.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/Float_Weights.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/CNN_tb.cpp} c {} cas {D:/Verilog/signals_N_label_hex.txt D:/Verilog/signals_label_V_hex.txt D:/Verilog/signals_label_R_hex.txt D:/Verilog/signals_label_N_hex.txt D:/Verilog/signals_label_L_hex.txt D:/Verilog/signals_label_A_hex.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/signals2.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/signals1.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/output.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/outPE.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/labels2.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/labels1.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/Float_Weights.txt D:/PhamDuyHoang_LuongVanDai_DA2/CNN_nopad/CNN_tb.cpp}}
set SpecLanguage C
set TVInFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TVOutFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TBTops {verilog {} bc {} sc {} vhdl {} c {} cas {}}
set TBInstNames {verilog {} bc {} sc {} vhdl {} c {} cas {}}
set XDCFiles {}
set ExtraGlobalOptions {"area_timing" 1 "clock_gate" 1 "impl_flow" map "power_gate" 0}
set TBTVFileNotFound {}
set AppFile {}
set ApsFile hls.aps
set AvePath ../../.
set DefaultPlatform DefaultPlatform
set multiClockList {}
set SCPortClockMap {}
set intNbAccess 0
set PlatformFiles {{DefaultPlatform {xilinx/zynquplus/zynquplus}}}
set HPFPO 0
