`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2024 04:17:07 PM
// Design Name: 
// Module Name: fsm_decode
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



module fsm_decode(
    input clk,reset_n,
    input frame_n,
    input valid_n,
    input din,
    input [15:0] busy,
    output [15:0] frameo_n,
    output [15:0] valido_n,
    output [15:0] dout
    );
    wire [3:0] Address;
    wire [15:0] dout_fsm;
    Router_fsm DUT(.clk(clk),.reset_n(reset_n),.busy(busy),.valid_n(valid_n),.frame_n(frame_n),.din(din),.Addr(Address),.dout(dout_fsm));
    Decode_1x16 DUT1(.Address(Address),.frame_n(frame_n),.valid_n(valid_n),.din(dout_fsm),.frameo_n(frameo_n),.valido_n(valido_n),.dout(dout));
endmodule
