module tt_um_fsm_top (
   // input  wire CLK100MHZ,
   // input  wire BTNC,
   // input  wire [1:0] SW,
   // output [2:0] LED,
    input  [7:0] ui_in,
    output [7:0] uo_out,
    output [7:0] uio_out,
    input  [7:0] uio_in,
    output [7:0] uio_oe,
    input clk,
    input ena,
    input rst_n
);
    //wire [7:0] result;
   // wire clk_1Hz;
    //wire [7:0] d;
    // Instancia del prescaler
  //  prescaler_clk prescaler_inst (
  //     .clk_in(ui_in),
  //     .reset(ui_in),
  //      .clk_out(clk_1Hz)
   // );

    // Instancia del módulo principal
    arranque_rampa_parcial rampa_inst (
        .clk(clk_1Hz),
       .reset(ui_in),
       .Rapido(ui_in[0]),
        .Lento(ui_in[1]),
        .out_30(uo_out[0]),
        .out_50(uo_out[1]),
       .out_100(uo_out[2])
       // .Rapido(SW[0]),
        //.Lento(SW[1]),
       // .out_30(LED[0]),
       // .out_50(LED[1]),
       // .out_100(LED[2])
    );
   // assign uo_out = result;
    assign uio_out = 8'b00000000; // o alguna lógica válida
    assign uio_oe = 8'b00000000;        // habilita todas las salidas
    assign d = uio_in;
    
endmodule
