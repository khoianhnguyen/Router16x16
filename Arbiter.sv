`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2024 03:56:43 PM
// Design Name: 
// Module Name: Arbiter
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


module Arbiter(
    input [3:0] Address,Address_const,
    input [15:0] valid, frame,din,
    output valido_n,frameo_n,dout,
    output [15:0] busy 
    );
    wire [15:0] Address;
    Arbiter_router DUT1(.Address(Address),.Address_const(Address_const),.busy(busy),.valid(valid),.frame(frame),.din(din),.valido_n(valido_n),.frameo_n(frameo_n),.dout(dout),.Address_in(Address));
    Arbiter_return DUT2(.frameo_n(frameo_n),.Address(Address),.busy_return(busy));
endmodule
