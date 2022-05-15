module PRPG(clk,Load);

input clk;
input Load;
output [2:0] Din;
output [2:0] Q_out;
output Q1, Q2, Q3;

reg [2:0] Din;
reg [2:0] Q_out;
reg Q1, Q2, Q3;
reg temp;

initial
begin
    temp = 0;
    Q1 = 1;
    Q2 = 0;
    Q3 = 0;
    Q_out = 3'b001;
    Din = 3'b111;
end

always@ (posedge clk or posedge Load)
begin
    if(Load)
    begin
        Q1 = Din[0];
        Q2 = Din[1];
        Q3 = Din[2];
    end

    else
    begin
        temp = Q1;
        Q1 = Q1 ^ Q3;
        Q3 = Q2;
        Q2 = temp;
    end

    Q_out[0] = Q1;
    Q_out[1] = Q2;
    Q_out[2] = Q3;
end
endmodule
