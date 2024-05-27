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
  adder4 tt_um_adder4(
      .A (ui_in[3:0]),
      .B (ui_in[7:4]),
      .S (uo_out[3:0]),
      .C4 (uo_out[7])
  );
    
endmodule
module adder4( 
    input wire [3:0] A,
    input wire [3:0] B,
    output wire [3:0] S,
    output wire C4
    
    );
    wire C1,C2,C3;
   
  my_full_adder fa0 (A[0],B[0],0,  S[0],C1);
    my_full_adder fa1 (A[1],B[1],C1,S[1],C2);
    my_full_adder fa2 (A[2],B[2],C2,S[2],C3);
    my_full_adder fa3 (A[3],B[3],C3,S[3],C4);


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
