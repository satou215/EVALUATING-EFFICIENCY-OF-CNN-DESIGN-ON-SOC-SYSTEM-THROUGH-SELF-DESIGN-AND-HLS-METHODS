//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
//Tool Version Limit: 2025.05
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`ifndef CNN_CONFIG__SV                        
    `define CNN_CONFIG__SV                    
                                                            
    class CNN_config extends uvm_object;            
                                                            
        int check_ena;                                      
        int cover_ena;                                      
        svr_pkg::svr_config port_OutModel_cfg;

        `uvm_object_utils_begin(CNN_config)         
        `uvm_field_object(port_OutModel_cfg, UVM_DEFAULT)
        `uvm_field_int   (check_ena , UVM_DEFAULT)          
        `uvm_field_int   (cover_ena , UVM_DEFAULT)          
        `uvm_object_utils_end                               

        function new (string name = "CNN_config");
            super.new(name);                                
            port_OutModel_cfg = svr_pkg::svr_config::type_id::create("port_OutModel_cfg");
        endfunction                                         
                                                            
    endclass                                                
                                                            
`endif                                                      
