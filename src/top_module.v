module top_module (
    input  wire CLK100MHZ,
    input  wire BTNC,
    input  wire [1:0] SW,
    output [2:0] LED
);
    wire clk_1Hz;

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
endmodule
