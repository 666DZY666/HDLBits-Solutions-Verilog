module top_module (
    input clk,
    input areset,
    input in,
    output out
);

reg cs, ns;
parameter A = 1'b0, B = 1'b1;
always @(posedge clk or posedge areset)
    if (areset) cs <= B;
    else cs <= ns;
always @(*)
    case (cs)
        A: ns = in ? A : B;
        B: ns = in ? B : A;
        default: ns = B;
    endcase
assign out = cs == B;

endmodule