module tb;

    reg [3:0] in_tb;
    reg mealy_switch_tb;
    wire [6:0] out_seg1_tb, out_seg2_tb;

    system dut (
        .in(in_tb),
        .mealy_switch(mealy_switch_tb),
        .out_seg1(out_seg1_tb),
        .out_seg2(out_seg2_tb)
    );

    reg clk = 0;
    always #5 clk = ~clk; // Toggle clock every 5 time units

    initial begin
        in_tb = 4'b1111;
        mealy_switch_tb = 0;
        
        // Test case 1: Switch through states
        #10 mealy_switch_tb = 1;
        #10 mealy_switch_tb = 0;
        #10 mealy_switch_tb = 1;
        #10 mealy_switch_tb = 0;
        
        // Test case 2: Stay in one state
        #10 mealy_switch_tb = 1;
        #10 mealy_switch_tb = 0;
        #10 mealy_switch_tb = 0;
        #10 mealy_switch_tb = 0;
        
        // Add more test cases as needed
        
        // End simulation
        $finish;
    end

endmodule
