module system (
    input [3:0] in,
    input mealy_switch,
    output reg [6:0] out_seg1,
    output reg [6:0] out_seg2
);

    wire [15:0] decoder_out;  
    wire [6:0] oct_out1, oct_out2;
    wire [6:0] deci_out1, deci_out2;
    wire [6:0] hex_out1, hex_out2;

    decoder decoder_inst (.in(in), .out(decoder_out));

    octal oct_inst (.in(decoder_out), .out1(oct_out1), .out2(oct_out2));
    decimal deci_inst (.in(decoder_out), .out1(deci_out1), .out2(deci_out2));
    hexadecimal hex_inst (.in(decoder_out), .out1(hex_out1), .out2(hex_out2));

    reg [1:0] state;
reg mealy_switch_last = 0;

always @(mealy_switch) begin
    if (mealy_switch == 1'b1 && mealy_switch_last == 1'b0) begin
        case (state)
            2'b00: state <= 2'b01;
            2'b01: state <= 2'b10;
            2'b10: state <= 2'b00;
            default: state <= 2'b00;
        endcase
    end
    mealy_switch_last <= mealy_switch;
end


always @* begin
    case (state)
        2'b00: begin
            out_seg1 = oct_out1;
            out_seg2 = oct_out2;
        end
        2'b01: begin
            out_seg1 = deci_out1;
            out_seg2 = deci_out2;
        end
        2'b10: begin
            out_seg1 = hex_out1;
            out_seg2 = hex_out2;
        end
        default: begin
            out_seg1 = 7'b0000000;
            out_seg2 = 7'b0000000;
        end
    endcase
end

endmodule
