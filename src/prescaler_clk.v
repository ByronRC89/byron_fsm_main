`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2025 19:59:41
// Design Name: 
// Module Name: prescaler_clk
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module prescaler (
    input  wire clk_in,      // CLK100MHZ
    input  wire reset,
    output clk_out      // Salida de 1 Hz
);
    parameter integer MAX_COUNT = 50_000_000 - 1;

    wire [25:0] counter = 0;

    always_ff @(posedge clk_in or posedge reset) begin
        if (reset) begin
            counter <= 0;
            clk_out <= 0;
        end else if (counter == MAX_COUNT) begin
            counter <= 0;
            clk_out <= ~clk_out;
        end else begin
            counter <= counter + 1;
        end
    end
endmodule
