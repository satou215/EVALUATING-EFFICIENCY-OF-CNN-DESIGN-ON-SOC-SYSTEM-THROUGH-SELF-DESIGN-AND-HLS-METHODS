//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
//Tool Version Limit: 2025.05
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`ifndef CNN_ENV__SV                                                                                   
    `define CNN_ENV__SV                                                                               
                                                                                                                    
                                                                                                                    
    class CNN_env extends uvm_env;                                                                          
                                                                                                                    
        CNN_virtual_sequencer CNN_virtual_sqr;                                                      
        CNN_config CNN_cfg;                                                                         
                                                                                                                    
        svr_pkg::svr_env#(16) env_slave_svr_OutModel;
                                                                                                                    
        CNN_reference_model   refm;                                                                         
                                                                                                                    
        CNN_subsystem_monitor subsys_mon;                                                                   
                                                                                                                    
        `uvm_component_utils_begin(CNN_env)                                                                 
        `uvm_field_object (env_slave_svr_OutModel,  UVM_DEFAULT | UVM_REFERENCE)
        `uvm_field_object (refm, UVM_DEFAULT | UVM_REFERENCE)                                                       
        `uvm_field_object (CNN_virtual_sqr, UVM_DEFAULT | UVM_REFERENCE)                                    
        `uvm_field_object (CNN_cfg        , UVM_DEFAULT)                                                    
        `uvm_component_utils_end                                                                                    
                                                                                                                    
        function new (string name = "CNN_env", uvm_component parent = null);                              
            super.new(name, parent);                                                                                
        endfunction                                                                                                 
                                                                                                                    
        extern virtual function void build_phase(uvm_phase phase);                                                  
        extern virtual function void connect_phase(uvm_phase phase);                                                
        extern virtual task          run_phase(uvm_phase phase);                                                    
                                                                                                                    
    endclass                                                                                                        
                                                                                                                    
    function void CNN_env::build_phase(uvm_phase phase);                                                    
        super.build_phase(phase);                                                                                   
        CNN_cfg = CNN_config::type_id::create("CNN_cfg", this);                           
                                                                                                                    
        CNN_cfg.port_OutModel_cfg.svr_type = svr_pkg::SVR_SLAVE ;
        env_slave_svr_OutModel  = svr_env#(16)::type_id::create("env_slave_svr_OutModel", this);
        uvm_config_db#(svr_pkg::svr_config)::set(this, "env_slave_svr_OutModel*", "cfg", CNN_cfg.port_OutModel_cfg);
        CNN_cfg.port_OutModel_cfg.prt_type = svr_pkg::AP_VLD;
        CNN_cfg.port_OutModel_cfg.is_active = svr_pkg::SVR_ACTIVE;
        CNN_cfg.port_OutModel_cfg.spec_cfg = svr_pkg::NORMAL;
        CNN_cfg.port_OutModel_cfg.reset_level = svr_pkg::RESET_LEVEL_HIGH;
 



        refm = CNN_reference_model::type_id::create("refm", this);


        uvm_config_db#(CNN_reference_model)::set(this, "*", "refm", refm);


        `uvm_info(this.get_full_name(), "set reference model by uvm_config_db", UVM_LOW)


        subsys_mon = CNN_subsystem_monitor::type_id::create("subsys_mon", this);


        CNN_virtual_sqr = CNN_virtual_sequencer::type_id::create("CNN_virtual_sqr", this);
        `uvm_info(this.get_full_name(), "build_phase done", UVM_LOW)
    endfunction


    function void CNN_env::connect_phase(uvm_phase phase);
        super.connect_phase(phase);


        CNN_virtual_sqr.svr_port_OutModel_sqr = env_slave_svr_OutModel.s_agt.sqr;
        env_slave_svr_OutModel.s_agt.mon.item_collect_port.connect(subsys_mon.svr_slave_OutModel_imp);
 
        refm.CNN_cfg = CNN_cfg;
        `uvm_info(this.get_full_name(), "connect phase done", UVM_LOW)
    endfunction


    task CNN_env::run_phase(uvm_phase phase);
        `uvm_info(this.get_full_name(), "CNN_env is running", UVM_LOW)
    endtask


`endif
