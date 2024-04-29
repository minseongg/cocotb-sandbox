# This file is public domain, it can be freely copied without restrictions.
# SPDX-License-Identifier: CC0-1.0

# Makefile

# defaults
SIM ?= icarus
WAVES ?= 0
TOPLEVEL_LANG ?= verilog

PLUSARGS += -fst

ifeq ($(WAVES), 1)
	VERILOG_SOURCES += iverilog_dump.v
	COMPILE_ARGS += -s iverilog_dump
endif

VERILOG_SOURCES += $(PWD)/my_design.sv
# use VHDL_SOURCES for VHDL files

# TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL = my_design

# MODULE is the basename of the Python test file
MODULE = test_my_design

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim

iverilog_dump.v:
	echo 'module iverilog_dump();' > $@
	echo 'initial begin' >> $@
	echo '    $$dumpfile("$(TOPLEVEL).fst");' >> $@
	echo '    $$dumpvars(0, $(TOPLEVEL));' >> $@
	echo 'end' >> $@
	echo 'endmodule' >> $@
