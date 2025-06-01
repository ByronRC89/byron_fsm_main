TOPLEVEL_LANG = verilog
VERILOG_SOURCES = ../src/tt_um_fsm_top.v ../src/prescaler_clk.v ../src/arranque_rampa_parcial.v
TOPLEVEL = tt_um_fsm_top
MODULE = test_user_module

SIM = icarus

# Generar resultados en formato JUnit XML para GitHub Actions
EXTRA_ARGS += --junit-xml=results.xml


include $(shell cocotb-config --makefiles)/Makefile.inc

# Regla clean necesaria para evitar errores
clean:
	rm -rf sim_build __pycache__ results.xml
