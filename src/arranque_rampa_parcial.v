module arranque_rampa_parcial (
    input  clk,
    input  reset,
    input  Rapido,
    input  Lento,
    output out_30,
    output out_50,
    output out_100
);

    wire estado_actual, estado_siguiente;

    wire notEA, notES, notR, notL;
    wire and1, and2, and3, and4, and5, and6, and7;
    wire or1, or2;

    assign wire notEA = ~estado_actual;
    assign wire notES = ~estado_siguiente;
    assign wire notR  = ~Rapido;
    assign wire notL  = ~Lento;

    assign wire and1 = notEA & Rapido;
    assign wire and2 = notR & notL;
    assign wire and3 = estado_siguiente & ~and2;
    assign wire and6 = notEA & Lento;
    assign wire and7 = notES & estado_actual;
    assign wire and4 = ~and3 & estado_siguiente;
    assign wire and5 = ~and4 & ~and7;
    assign wire or1 = Rapido | notEA;
    assign wire or2 = ~and5 | Rapido;

    // Estado siguiente
    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            estado_siguiente <= 0;
        else
            estado_siguiente <= ~or2;
    end

    // Estado actual
    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            estado_actual <= 0;
        else
            estado_actual <= ~and3;
    end

    assign out_30  = ~(estado_siguiente | notEA);   // OR3
    assign out_50  = ~(notES | estado_actual);      // OR4
    assign out_100 = ~(notES | notEA);              // OR5

endmodule
