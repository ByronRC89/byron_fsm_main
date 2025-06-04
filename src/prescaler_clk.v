module prescaler_clk (
    input clk_in,
    input reset,
    output reg clk_out
);
    reg [25:0] contador;

    always @(posedge clk_in or posedge reset) begin
        if (reset) begin
            contador <= 26'd0;
            clk_out <= 0;
        end else begin
            if (contador == 26'd49_999_999) begin
                contador <= 0;
                clk_out <= ~clk_out;
            end else begin
                contador <= contador + 1;
            end
        end
    end
endmodule
