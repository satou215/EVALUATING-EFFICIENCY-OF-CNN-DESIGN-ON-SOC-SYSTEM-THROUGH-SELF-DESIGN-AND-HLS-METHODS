//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
//Tool Version Limit: 2025.05
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.

`ifndef SVR_MASTER_SEQUENCER__SV
	`define SVR_MASTER_SEQUENCER__SV
    
	class svr_master_sequencer#(int DATA_WIDTH = 32) extends uvm_sequencer #(svr_transfer#(DATA_WIDTH));
        
		function new (string name, uvm_component parent);
			super.new (name, parent);
            `uvm_info(this.get_full_name(), "new is called", UVM_LOW)
		endfunction
        
		`uvm_component_param_utils_begin(svr_master_sequencer#(DATA_WIDTH))
        `uvm_component_utils_end
	endclass
    
`endif
