set ModuleHierarchy {[{
"Name" : "CNN", "RefName" : "CNN","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_CNN_Pipeline_loop_for_channel_pad_0_fu_925", "RefName" : "CNN_Pipeline_loop_for_channel_pad_0","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "loop_for_channel_pad_0","RefName" : "loop_for_channel_pad_0","ID" : "2","Type" : "pipeline"},]},
	{"Name" : "grp_CNN_Pipeline_loop_for_3_channel_pad_1_loop_for_channel_pad_1_fu_933", "RefName" : "CNN_Pipeline_loop_for_3_channel_pad_1_loop_for_channel_pad_1","ID" : "3","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "loop_for_3_channel_pad_1_loop_for_channel_pad_1","RefName" : "loop_for_3_channel_pad_1_loop_for_channel_pad_1","ID" : "4","Type" : "pipeline"},]},
	{"Name" : "grp_CNN_Pipeline_VITIS_LOOP_41_1_loop_for_ap_1_fu_957", "RefName" : "CNN_Pipeline_VITIS_LOOP_41_1_loop_for_ap_1","ID" : "5","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_41_1_loop_for_ap_1","RefName" : "VITIS_LOOP_41_1_loop_for_ap_1","ID" : "6","Type" : "pipeline"},]},
	{"Name" : "grp_CNN_Pipeline_loop_for_channel_pool_0_loop_for_weight_pool_0_fu_967", "RefName" : "CNN_Pipeline_loop_for_channel_pool_0_loop_for_weight_pool_0","ID" : "7","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "loop_for_channel_pool_0_loop_for_weight_pool_0","RefName" : "loop_for_channel_pool_0_loop_for_weight_pool_0","ID" : "8","Type" : "pipeline"},]},
	{"Name" : "grp_CNN_Pipeline_loop_for_3_channel_pad_2_loop_for_channel_pad_2_fu_973", "RefName" : "CNN_Pipeline_loop_for_3_channel_pad_2_loop_for_channel_pad_2","ID" : "9","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "loop_for_3_channel_pad_2_loop_for_channel_pad_2","RefName" : "loop_for_3_channel_pad_2_loop_for_channel_pad_2","ID" : "10","Type" : "pipeline"},]},
	{"Name" : "grp_CNN_Pipeline_VITIS_LOOP_67_1_loop_for_ap_2_fu_980", "RefName" : "CNN_Pipeline_VITIS_LOOP_67_1_loop_for_ap_2","ID" : "11","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_67_1_loop_for_ap_2","RefName" : "VITIS_LOOP_67_1_loop_for_ap_2","ID" : "12","Type" : "pipeline"},]},
	{"Name" : "grp_CNN_Pipeline_loop_for_3_channel_pad_3_loop_for_channel_pad_3_fu_989", "RefName" : "CNN_Pipeline_loop_for_3_channel_pad_3_loop_for_channel_pad_3","ID" : "13","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "loop_for_3_channel_pad_3_loop_for_channel_pad_3","RefName" : "loop_for_3_channel_pad_3_loop_for_channel_pad_3","ID" : "14","Type" : "pipeline"},]},
	{"Name" : "grp_CNN_Pipeline_VITIS_LOOP_93_1_loop_for_ap_3_fu_997", "RefName" : "CNN_Pipeline_VITIS_LOOP_93_1_loop_for_ap_3","ID" : "15","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_93_1_loop_for_ap_3","RefName" : "VITIS_LOOP_93_1_loop_for_ap_3","ID" : "16","Type" : "pipeline"},]},
	{"Name" : "grp_CNN_Pipeline_loop_for_channel_pool_1_loop_for_weight_pool_1_fu_1007", "RefName" : "CNN_Pipeline_loop_for_channel_pool_1_loop_for_weight_pool_1","ID" : "17","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "loop_for_channel_pool_1_loop_for_weight_pool_1","RefName" : "loop_for_channel_pool_1_loop_for_weight_pool_1","ID" : "18","Type" : "pipeline"},]},
	{"Name" : "grp_CNN_Pipeline_loop_for_3_channel_pad_4_loop_for_channel_pad_4_fu_1013", "RefName" : "CNN_Pipeline_loop_for_3_channel_pad_4_loop_for_channel_pad_4","ID" : "19","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "loop_for_3_channel_pad_4_loop_for_channel_pad_4","RefName" : "loop_for_3_channel_pad_4_loop_for_channel_pad_4","ID" : "20","Type" : "pipeline"},]},
	{"Name" : "grp_CNN_Pipeline_VITIS_LOOP_119_1_loop_for_ap_4_fu_1021", "RefName" : "CNN_Pipeline_VITIS_LOOP_119_1_loop_for_ap_4","ID" : "21","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_119_1_loop_for_ap_4","RefName" : "VITIS_LOOP_119_1_loop_for_ap_4","ID" : "22","Type" : "pipeline"},]},
	{"Name" : "grp_CNN_Pipeline_loop_for_3_channel_pad_5_loop_for_channel_pad_5_fu_1031", "RefName" : "CNN_Pipeline_loop_for_3_channel_pad_5_loop_for_channel_pad_5","ID" : "23","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "loop_for_3_channel_pad_5_loop_for_channel_pad_5","RefName" : "loop_for_3_channel_pad_5_loop_for_channel_pad_5","ID" : "24","Type" : "pipeline"},]},
	{"Name" : "grp_CNN_Pipeline_loop_for_channel_pool_2_loop_for_weight_pool_2_fu_1037", "RefName" : "CNN_Pipeline_loop_for_channel_pool_2_loop_for_weight_pool_2","ID" : "25","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "loop_for_channel_pool_2_loop_for_weight_pool_2","RefName" : "loop_for_channel_pool_2_loop_for_weight_pool_2","ID" : "26","Type" : "pipeline"},]},
	{"Name" : "grp_CNN_Pipeline_loop_for_3_channel_pad_6_loop_for_channel_pad_6_fu_1054", "RefName" : "CNN_Pipeline_loop_for_3_channel_pad_6_loop_for_channel_pad_6","ID" : "27","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "loop_for_3_channel_pad_6_loop_for_channel_pad_6","RefName" : "loop_for_3_channel_pad_6_loop_for_channel_pad_6","ID" : "28","Type" : "pipeline"},]},
	{"Name" : "grp_CNN_Pipeline_loop_for_3_channel_pad_7_loop_for_channel_pad_7_fu_1060", "RefName" : "CNN_Pipeline_loop_for_3_channel_pad_7_loop_for_channel_pad_7","ID" : "29","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "loop_for_3_channel_pad_7_loop_for_channel_pad_7","RefName" : "loop_for_3_channel_pad_7_loop_for_channel_pad_7","ID" : "30","Type" : "pipeline"},]},
	{"Name" : "grp_CNN_Pipeline_loop_for_channel_pool_3_loop_for_weight_pool_3_fu_1078", "RefName" : "CNN_Pipeline_loop_for_channel_pool_3_loop_for_weight_pool_3","ID" : "31","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "loop_for_channel_pool_3_loop_for_weight_pool_3","RefName" : "loop_for_channel_pool_3_loop_for_weight_pool_3","ID" : "32","Type" : "pipeline"},]},
	{"Name" : "grp_CNN_Pipeline_VITIS_LOOP_93_1_fu_1105", "RefName" : "CNN_Pipeline_VITIS_LOOP_93_1","ID" : "33","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_93_1","RefName" : "VITIS_LOOP_93_1","ID" : "34","Type" : "pipeline"},]},
	{"Name" : "grp_CNN_Pipeline_loop_for_a_Dense_0_fu_1120", "RefName" : "CNN_Pipeline_loop_for_a_Dense_0","ID" : "35","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "loop_for_a_Dense_0","RefName" : "loop_for_a_Dense_0","ID" : "36","Type" : "pipeline"},]},
	{"Name" : "grp_CNN_Pipeline_loop_for_a_Dense_1_fu_1161", "RefName" : "CNN_Pipeline_loop_for_a_Dense_1","ID" : "37","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "loop_for_a_Dense_1","RefName" : "loop_for_a_Dense_1","ID" : "38","Type" : "pipeline"},]},
	{"Name" : "grp_CNN_Pipeline_loop_detect_fu_1190", "RefName" : "CNN_Pipeline_loop_detect","ID" : "39","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "loop_detect","RefName" : "loop_detect","ID" : "40","Type" : "pipeline"},]},],
"SubLoops" : [
	{"Name" : "VITIS_LOOP_15_1","RefName" : "VITIS_LOOP_15_1","ID" : "41","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_CNN_Pipeline_loop_for_ap_0_fu_941", "RefName" : "CNN_Pipeline_loop_for_ap_0","ID" : "42","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "loop_for_ap_0","RefName" : "loop_for_ap_0","ID" : "43","Type" : "pipeline"},]},]},
	{"Name" : "VITIS_LOOP_145_1","RefName" : "VITIS_LOOP_145_1","ID" : "44","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_CNN_Pipeline_loop_for_ap_5_loop_for_fc_5_loop_for_fa_5_fu_1043", "RefName" : "CNN_Pipeline_loop_for_ap_5_loop_for_fc_5_loop_for_fa_5","ID" : "45","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "loop_for_ap_5_loop_for_fc_5_loop_for_fa_5","RefName" : "loop_for_ap_5_loop_for_fc_5_loop_for_fa_5","ID" : "46","Type" : "pipeline"},]},]},
	{"Name" : "VITIS_LOOP_171_1","RefName" : "VITIS_LOOP_171_1","ID" : "47","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_CNN_Pipeline_loop_for_ap_6_loop_for_fc_6_loop_for_fa_6_fu_1066", "RefName" : "CNN_Pipeline_loop_for_ap_6_loop_for_fc_6_loop_for_fa_6","ID" : "48","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "loop_for_ap_6_loop_for_fc_6_loop_for_fa_6","RefName" : "loop_for_ap_6_loop_for_fc_6_loop_for_fa_6","ID" : "49","Type" : "pipeline"},]},]},
	{"Name" : "VITIS_LOOP_197_1","RefName" : "VITIS_LOOP_197_1","ID" : "50","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_CNN_Pipeline_loop_for_ap_7_loop_for_fc_7_loop_for_fa_7_fu_1093", "RefName" : "CNN_Pipeline_loop_for_ap_7_loop_for_fc_7_loop_for_fa_7","ID" : "51","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "loop_for_ap_7_loop_for_fc_7_loop_for_fa_7","RefName" : "loop_for_ap_7_loop_for_fc_7_loop_for_fa_7","ID" : "52","Type" : "pipeline"},]},]},]
}]}