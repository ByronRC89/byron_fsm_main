module tt_um_fsm_top (
    input  clk,
    input  [3:0] ui_in,     // ui_in[0]=Rapido, ui_in[1]=Lento, ui_in[2]=clk_prescaler, ui_in[3]=reset
    output [2:0] uo_out     // uo_out[0]=out_30, uo_out[1]=out_50, uo_out[2]=out_100
     input  ena, 
);

    wire clk_1Hz;

    prescaler_clk prescaler_inst (
        .clk_in(clk),
        .reset(ui_in[3]),
        .clk_out(clk_1Hz)
    );

    arranque_rampa_parcial rampa_inst (
        .clk(clk_1Hz),
        .reset(ui_in[3]),
        .Rapido(ui_in[0]),
        .Lento(ui_in[1]),
        .out_30(uo_out[0]),
        .out_50(uo_out[1]),
        .out_100(uo_out[2])
    );

endmodule

