module tt_um_fsm_top (
    input  wire CLK100MHZ,
    input  wire BTNC,
    input  wire [1:0] SW,
    output [2:0] LED,
    input  [7:0] ui_in,
    output [7:0] uo_out,
    output [7:0] uio_out,
    input  [7:0] uio_in,
    output [7:0] uio_oe,
    input clk,
    input ena,
    input rst_n
);
    wire clk_1Hz;
    wire [7:0] d;
    // Instancia del prescaler
    prescaler prescaler_inst (
        .clk_in(CLK100MHZ),
        .reset(BTNC),
        .clk_out(clk_1Hz)
    );

    // Instancia del módulo principal
    arranque_rampa_parcial rampa_inst (
        .clk(clk_1Hz),
        .reset(BTNC),
        .Rapido(SW[0]),
        .Lento(SW[1]),
        .out_30(LED[0]),
        .out_50(LED[1]),
        .out_100(LED[2])
    );
     assign uio_out = 8'b00000000; // o alguna lógica válida
    assign uio_oe = 8'b00000000;        // habilita todas las salidas
    assign d = uio_in;
    
endmodule
