module tt_um_fsm_top (
    input clk,
    input rst_n,
    input ena,
    input [7:0] ui_in,
    output [7:0] uo_out,
    input [7:0] uio_in,
    output [7:0] uio_out,
    output [7:0] uio_oe
);

    // Convertir reset activo bajo a activo alto
    wire reset;
    assign reset = ~rst_n;

    wire clk_1Hz;

    // Prescaler para generar señal lenta
    prescaler_clk prescaler_inst (
        .clk_in(clk),
        .reset(reset),
        .clk_out(clk_1Hz)
    );

    // FSM de encendido rampa
    arranque_rampa_parcial rampa_inst (
        .clk(clk_1Hz),
        .reset(reset),
        .Rapido(ui_in[0]),
        .Lento(ui_in[1]),
        .out_30(uo_out[0]),
        .out_50(uo_out[1]),
        .out_100(uo_out[2])
    );

    // Salidas no utilizadas
    assign uo_out[7:3] = 5'b0;
    assign uio_out = 8'b0;
    assign uio_oe = 8'b0;

endmodule
