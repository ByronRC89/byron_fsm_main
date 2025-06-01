`default_nettype none

module user_project_wrapper (
    input  wire        wb_clk_i,
    input  wire        wb_rst_i,
    input  wire        wbs_stb_i,
    input  wire        wbs_cyc_i,
    input  wire        wbs_we_i,
    input  wire [3:0]  wbs_sel_i,
    input  wire [31:0] wbs_dat_i,
    input  wire [31:0] wbs_adr_i,
    output wire [31:0] wbs_dat_o,
    output wire        wbs_ack_o,
    output wire        wbs_err_o,

    input  wire        clk,
    input  wire        rst_n,
    input  wire [7:0]  ui_in,
    output wire [7:0]  uo_out,
    input  wire [7:0]  uio_in,
    output wire [7:0]  uio_out,
    output wire [7:0]  uio_oe,

    input  wire [127:0] la_data_in,
    output wire [127:0] la_data_out,
    input  wire [127:0] la_oenb,

    input  wire [37:0] io_in,
    output wire [37:0] io_out,
    output wire [37:0] io_oeb,

    output wire [2:0] irq
);

    assign wbs_dat_o = 32'd0;
    assign wbs_ack_o = 1'b0;
    assign wbs_err_o = 1'b0;

    assign la_data_out = 128'd0;
    assign irq = 3'b000;
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
