import cocotb
from cocotb.triggers import Timer


@cocotb.test()
async def test_basic_addition(dut):
    # Test básico: A = 1, B = 2, sel = 000 (suma)
    dut.io_in.value = 0b00010010  # A=1 (bits 7:4), B=2 (bits 3:0), sel=000 (bits 2:0)
    await Timer(10, units='ns')
    assert dut.io_out.value == 3, f"Suma fallida: se obtuvo {dut.io_out.value}"
