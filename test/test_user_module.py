import cocotb
from cocotb.triggers import RisingEdge

@cocotb.test()
async def test_fsm_behavior(dut):
    dut._log.info("Iniciando prueba de FSM con prescaler")

    # Reset
    dut.rst_n.value = 0
    for _ in range(2):
        await RisingEdge(dut.clk)
    dut.rst_n.value = 1

    # Aplicar entrada lenta
    dut.ui_in.value = 0b00000010  # lento
    for _ in range(5):
        await RisingEdge(dut.clk)

    # Aplicar entrada rápida
    dut.ui_in.value = 0b00000001  # rapido
    for _ in range(5):
        await RisingEdge(dut.clk)

    dut._log.info("Finalizó la prueba")
