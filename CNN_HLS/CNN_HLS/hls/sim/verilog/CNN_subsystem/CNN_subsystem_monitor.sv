//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
//Tool Version Limit: 2025.05
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================

`ifndef CNN_SUBSYSTEM_MONITOR_SV
`define CNN_SUBSYSTEM_MONITOR_SV

`uvm_analysis_imp_decl(_svr_slave_OutModel)

class CNN_subsystem_monitor extends uvm_component;

    CNN_reference_model refm;
    CNN_scoreboard scbd;

    `uvm_component_utils_begin(CNN_subsystem_monitor)
    `uvm_component_utils_end

    uvm_analysis_imp_svr_slave_OutModel#(svr_pkg::svr_transfer#(16), CNN_subsystem_monitor) svr_slave_OutModel_imp;

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(CNN_reference_model)::get(this, "", "refm", refm))
            `uvm_fatal(this.get_full_name(), "No refm from high level")
        `uvm_info(this.get_full_name(), "get reference model by uvm_config_db", UVM_MEDIUM)
        scbd = CNN_scoreboard::type_id::create("scbd", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
    endfunction

    function new (string name = "", uvm_component parent = null);
        super.new(name, parent);
        svr_slave_OutModel_imp = new("svr_slave_OutModel_imp", this);
    endfunction

    virtual function void write_svr_slave_OutModel(svr_transfer#(16) tr);
        refm.write_svr_slave_OutModel(tr);
        scbd.write_svr_slave_OutModel(tr);
    endfunction
endclass
`endif
