/*
 * Copyright (c) 2024 Drago Markov
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_adder4 (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
    assign uo_out[6:4] = 0;  // Example: ou_out is the sum of ui_in and uio_in
    assign uio_out = 0;
    assign uio_oe  = 0;
    wire C1,C2,C3, C4, S0, S1, S2, S3;
    my_full_adder fa0 (ui_in[0],ui_in[4],1'h0, S0,C1);
    my_full_adder fa1 (ui_in[1],ui_in[5],C1,S1,C2);
    my_full_adder fa2 (ui_in[2],ui_in[6],C2,S2,C3);
    my_full_adder fa3 (ui_in[3],ui_in[7],C3,S3, C4);
    assign uo_out[0]=S0;
    assign uo_out[1]=S1;
    assign uo_out[2]=S2;
    assign uo_out[3]=S3;
    assign uo_out[7]=C4;
    
endmodule

module my_full_adder( input A,
       input B,
       input CIN,
       output S,
       output COUT
       );
       assign S = A^B^CIN;
       assign COUT = (A&B) | (CIN&(A^B));

endmodule
