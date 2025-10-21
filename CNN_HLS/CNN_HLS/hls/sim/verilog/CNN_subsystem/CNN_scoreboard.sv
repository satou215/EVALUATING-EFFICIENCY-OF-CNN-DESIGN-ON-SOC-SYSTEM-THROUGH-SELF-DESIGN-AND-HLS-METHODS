//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
//Tool Version Limit: 2025.05
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`ifndef CNN_SCOREBOARD__SV                                                       
    `define CNN_SCOREBOARD__SV                                                   
                                                                                               
    `define AUTOTB_TVOUT_OutModel_OutModel_wrapc  "../tv/rtldatafile/rtl.CNN.autotvout_OutModel.dat"
                                                                                               
    class CNN_scoreboard extends uvm_component;                                        
                                                                                               
        CNN_reference_model refm;                                                      
                                                                                               
        typedef integer TRANS_SIZE_QUEUE_TYPE [$];                                      
        TRANS_SIZE_QUEUE_TYPE TVOUT_transaction_size_queue;                                
        int write_file_done_OutModel_OutModel;                                                          
        int write_section_done_OutModel_OutModel = 0;                                                   
                                                                                           
        file_agent_pkg::file_write_agent#(16) file_wr_port_OutModel_OutModel;
    svr_transfer#(16) OutModel_apvld_rxtr;
                                                                                               
        `uvm_component_utils_begin(CNN_scoreboard)                                     
        `uvm_field_object(refm  , UVM_DEFAULT)                                                 
        `uvm_field_queue_int(TVOUT_transaction_size_queue, UVM_DEFAULT)                    
        `uvm_field_object(file_wr_port_OutModel_OutModel, UVM_DEFAULT)
        `uvm_field_int(write_file_done_OutModel_OutModel, UVM_DEFAULT)
        `uvm_field_int(write_section_done_OutModel_OutModel, UVM_DEFAULT)
        `uvm_component_utils_end                                                               
                                                                                               
        virtual function void build_phase(uvm_phase phase);                                    
            if (!uvm_config_db #(CNN_reference_model)::get(this, "", "refm", refm))
                `uvm_fatal(this.get_full_name(), "No refm from high level")                  
            `uvm_info(this.get_full_name(), "get reference model by uvm_config_db", UVM_MEDIUM) 
                                                                                               
            file_wr_port_OutModel_OutModel = file_agent_pkg::file_write_agent#(16)::type_id::create("file_wr_port_OutModel_OutModel", this);
        endfunction                                                                            
                                                                                               
        function new (string name = "", uvm_component parent = null);                        
            super.new(name, parent);                                                           
            write_file_done_OutModel_OutModel = 0;                                                          
        endfunction                                                                            
                                                                                               
        virtual task run_phase(uvm_phase phase);                                               
            create_TVOUT_transaction_size_queue_by_depth(1);
            file_wr_port_OutModel_OutModel.config_file(   
                    `AUTOTB_TVOUT_OutModel_OutModel_wrapc,
                    TVOUT_transaction_size_queue                            
                );                                                          
                                                                            

            fork                                                                               
                                                                                               
                forever begin                                                                  
                    @refm.dut2tb_ap_done;                                                             
                    `uvm_info(this.get_full_name(), "receive ap_done_for_nexttrans and do axim dump", UVM_LOW)           
            if (OutModel_apvld_rxtr) file_wr_port_OutModel_OutModel.write_TVOUT_data(OutModel_apvld_rxtr.data[15: 0]);
                    file_wr_port_OutModel_OutModel.receive_ap_done();
             OutModel_apvld_rxtr = null;
                end                                                                            
                begin                                                                          
                    @refm.finish;                                                              
                    `uvm_info(this.get_full_name(), "receive FINISH", UVM_LOW)               
                    file_wr_port_OutModel_OutModel.wait_write_file_done();
                end                                                                            
                begin                                                                      
                    forever begin                                                              
                        wait(write_section_done_OutModel_OutModel);                          
                        write_section_done_OutModel_OutModel = 0;                                               
                        -> refm.allsvr_output_done;                                         
                    end                                                                        
                end                                                                        
            join                                                                               
        endtask                                                                                
                                                                                               
        virtual function void create_TVOUT_transaction_size_queue_by_depth(integer depth); 
            integer i;                                                                     
            TVOUT_transaction_size_queue.delete();                                         
            for (i = 0; i < 1; i++)                                    
                TVOUT_transaction_size_queue.push_back(depth);                             
        endfunction                                                                        
                                                                                           
        virtual function void write_svr_slave_OutModel(svr_transfer#(16) tr);
            `uvm_info(this.get_full_name(), "port OutModel collected one pkt", UVM_DEBUG);          
             OutModel_apvld_rxtr = tr;
            write_section_done_OutModel_OutModel = 1;
        endfunction
                   
    endclass                                                                                   
                                                                                               
`endif                                                                                         
