 `timescale 1 ns/1 ns	//time scale for simulation

module TestBench();
    reg [2:0] SW;
    wire [0:0] LEDG;

    my21mux M(.sel(SW[2]), .in0(SW[1]), .in1(SW[0]), .y(LEDG[0]));

// Test Procedure
    initial begin
        SW = 3'b000; #5;
        SW = 3'b001; #5;
        SW = 3'b010; #5;
        SW = 3'b011; #5;
        SW = 3'b100; #5;
        SW = 3'b101; #5;
        SW = 3'b110; #5;
        SW = 3'b111; #5;
    end
endmodule