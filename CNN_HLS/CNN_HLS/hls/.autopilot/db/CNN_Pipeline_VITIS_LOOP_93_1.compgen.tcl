# This script segment is generated automatically by AutoPilot

set name CNN_mul_16s_18ns_34_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 404 \
    name OutPool3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename OutPool3 \
    op interface \
    ports { OutPool3_address0 { O 6 vector } OutPool3_ce0 { O 1 bit } OutPool3_q0 { I 16 vector } OutPool3_address1 { O 6 vector } OutPool3_ce1 { O 1 bit } OutPool3_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'OutPool3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 405 \
    name OutPool3_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename OutPool3_1 \
    op interface \
    ports { OutPool3_1_address0 { O 6 vector } OutPool3_1_ce0 { O 1 bit } OutPool3_1_q0 { I 16 vector } OutPool3_1_address1 { O 6 vector } OutPool3_1_ce1 { O 1 bit } OutPool3_1_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'OutPool3_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 406 \
    name OutPool3_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename OutPool3_2 \
    op interface \
    ports { OutPool3_2_address0 { O 6 vector } OutPool3_2_ce0 { O 1 bit } OutPool3_2_q0 { I 16 vector } OutPool3_2_address1 { O 6 vector } OutPool3_2_ce1 { O 1 bit } OutPool3_2_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'OutPool3_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 407 \
    name OutPool3_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename OutPool3_3 \
    op interface \
    ports { OutPool3_3_address0 { O 6 vector } OutPool3_3_ce0 { O 1 bit } OutPool3_3_q0 { I 16 vector } OutPool3_3_address1 { O 6 vector } OutPool3_3_ce1 { O 1 bit } OutPool3_3_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'OutPool3_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 408 \
    name OutPool3_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename OutPool3_4 \
    op interface \
    ports { OutPool3_4_address0 { O 6 vector } OutPool3_4_ce0 { O 1 bit } OutPool3_4_q0 { I 16 vector } OutPool3_4_address1 { O 6 vector } OutPool3_4_ce1 { O 1 bit } OutPool3_4_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'OutPool3_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 409 \
    name OutPool3_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename OutPool3_5 \
    op interface \
    ports { OutPool3_5_address0 { O 6 vector } OutPool3_5_ce0 { O 1 bit } OutPool3_5_q0 { I 16 vector } OutPool3_5_address1 { O 6 vector } OutPool3_5_ce1 { O 1 bit } OutPool3_5_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'OutPool3_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 410 \
    name OutPool3_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename OutPool3_6 \
    op interface \
    ports { OutPool3_6_address0 { O 6 vector } OutPool3_6_ce0 { O 1 bit } OutPool3_6_q0 { I 16 vector } OutPool3_6_address1 { O 6 vector } OutPool3_6_ce1 { O 1 bit } OutPool3_6_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'OutPool3_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 411 \
    name OutPool3_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename OutPool3_7 \
    op interface \
    ports { OutPool3_7_address0 { O 6 vector } OutPool3_7_ce0 { O 1 bit } OutPool3_7_q0 { I 16 vector } OutPool3_7_address1 { O 6 vector } OutPool3_7_ce1 { O 1 bit } OutPool3_7_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'OutPool3_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 412 \
    name OutPool3_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename OutPool3_8 \
    op interface \
    ports { OutPool3_8_address0 { O 6 vector } OutPool3_8_ce0 { O 1 bit } OutPool3_8_q0 { I 16 vector } OutPool3_8_address1 { O 6 vector } OutPool3_8_ce1 { O 1 bit } OutPool3_8_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'OutPool3_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 413 \
    name OutPool3_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename OutPool3_9 \
    op interface \
    ports { OutPool3_9_address0 { O 6 vector } OutPool3_9_ce0 { O 1 bit } OutPool3_9_q0 { I 16 vector } OutPool3_9_address1 { O 6 vector } OutPool3_9_ce1 { O 1 bit } OutPool3_9_q1 { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'OutPool3_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 414 \
    name OutGlobalAverPool1D \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename OutGlobalAverPool1D \
    op interface \
    ports { OutGlobalAverPool1D_address0 { O 5 vector } OutGlobalAverPool1D_ce0 { O 1 bit } OutGlobalAverPool1D_we0 { O 1 bit } OutGlobalAverPool1D_d0 { O 12 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'OutGlobalAverPool1D'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


# flow_control definition:
set InstName CNN_flow_control_loop_pipe_sequential_init_U
set CompName CNN_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix CNN_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


