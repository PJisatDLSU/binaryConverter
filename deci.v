module decimal (
    input [15:0] in,
    output reg [6:0] out1,
    output reg [6:0] out2
);

always @* begin
    case (in)
        16'b0000000000000001: begin out1 = 7'b1111110; out2 = 7'b0000000; end //0
        16'b0000000000000010: begin out1 = 7'b0110000; out2 = 7'b0000000; end //1
        16'b0000000000000100: begin out1 = 7'b1101101; out2 = 7'b0000000; end //2
        16'b0000000000001000: begin out1 = 7'b1111001; out2 = 7'b0000000; end //3
        16'b0000000000010000: begin out1 = 7'b0110011; out2 = 7'b0000000; end //4
        16'b0000000000100000: begin out1 = 7'b1011011; out2 = 7'b0000000; end //5
        16'b0000000001000000: begin out1 = 7'b1011111; out2 = 7'b0000000; end //6
        16'b0000000010000000: begin out1 = 7'b1110000; out2 = 7'b0000000; end //7    
        16'b0000000100000000: begin out1 = 7'b1111111; out2 = 7'b0000000; end //8
        16'b0000001000000000: begin out1 = 7'b1111011; out2 = 7'b0000000; end //9
        16'b0000010000000000: begin out1 = 7'b1111110; out2 = 7'b0110000; end //10
        16'b0000100000000000: begin out1 = 7'b0110000; out2 = 7'b0110000; end //11
        16'b0001000000000000: begin out1 = 7'b1101101; out2 = 7'b0110000; end //12
        16'b0010000000000000: begin out1 = 7'b1111001; out2 = 7'b0110000; end //13
        16'b0100000000000000: begin out1 = 7'b0110011; out2 = 7'b0110000; end //14
        16'b1000000000000000: begin out1 = 7'b1011011; out2 = 7'b0110000; end //15
        default: begin out1 = 7'b0000000; out2 = 7'b000000000; end
    endcase
end

endmodule
