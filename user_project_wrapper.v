`default_nettype none

module user_project_wrapper (


    input  wire        clk,
    input  wire        rst_n,
    input  wire [7:0]  ui_in,
    output wire [7:0]  uo_out,
    input  wire [7:0]  uio_in,
    output wire [7:0]  uio_out,
    output wire [7:0]  uio_oe,


    input  wire [37:0] io_in,
    output wire [37:0] io_out,
    output wire [37:0] io_oeb,

);
   
    assign io_out = 38'd0;
    assign io_oeb = 38'h3FFFFFFFFF;

    tt_um_fsm_top user_module (
        .clk(clk),
        .rst_n(rst_n),
        .ui_in(ui_in),
        .uo_out(uo_out),
        .uio_in(uio_in),
        .uio_out(uio_out[7:0]),
        .uio_oe(uio_oe[2:0])
    );

    assign uio_out[7:3] = 5'b00000;
    assign uio_oe[7:3]  = 5'b00000;

endmodule

`default_nettype wire
