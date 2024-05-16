`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2024 01:04:33 AM
// Design Name: 
// Module Name: Decode_1x16
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Decode_1x16(
    input [3:0] Address,
    input valid_n,
    input  frame_n,
    input [15:0] din,
    output reg [15:0] valido_n,
    output reg [15:0] frameo_n,
    output reg [15:0] dout
    );
    always@ (*) begin
        valido_n<=16'hxxxx;
        frameo_n<=16'hxxxx;
        dout<=16'hxxxx;
        valido_n[Address] <= valid_n;
        frameo_n[Address] <= frame_n;
        dout[Address]<= din[Address];
    end
endmodule
