module arranque_rampa_parcial (
    input  clk,
    input  reset,
    input  Rapido,
    input  Lento,
    output out_30,
    output out_50,
    output out_100
);

   assign estado_actual, estado_siguiente;

   assign wire notEA, notES, notR, notL;
   assign wire and1, and2, and3, and4, and5, and6, and7;
   assign wire or1, or2;

    assign notEA = ~estado_actual;
    assign notES = ~estado_siguiente;
    assign notR  = ~Rapido;
    assign notL  = ~Lento;

    assign and1 = notEA & Rapido;
    assign and2 = notR & notL;
    assign and3 = estado_siguiente & ~and2;
    assign and6 = notEA & Lento;
    assign and7 = notES & estado_actual;
    assign and4 = ~and3 & estado_siguiente;
    assign and5 = ~and4 & ~and7;
    assign or1 = Rapido | notEA;
    assign or2 = ~and5 | Rapido;

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
