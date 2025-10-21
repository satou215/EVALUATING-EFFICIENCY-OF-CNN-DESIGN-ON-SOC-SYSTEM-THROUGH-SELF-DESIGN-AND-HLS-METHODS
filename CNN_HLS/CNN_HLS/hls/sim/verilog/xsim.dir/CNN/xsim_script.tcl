set_param project.enableReportConfiguration 0
load_feature core
current_fileset
xsim {CNN} -testplusarg UVM_VERBOSITY=UVM_NONE -testplusarg UVM_TESTNAME=CNN_test_lib -testplusarg UVM_TIMEOUT=20000000000000 -view {{CNN_dataflow_ana.wcfg}} -tclbatch {CNN.tcl} -protoinst {CNN.protoinst}
