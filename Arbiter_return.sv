`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2024 10:50:41 AM
// Design Name: 
// Module Name: Arbiter_return
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


module Arbiter_return(
    input frameo_n,
    input [3:0] Address,
    output reg [15:0] busy_return
    );
    integer i;
    always @(*) begin
        for(i=0;i<=15;i=i+1) begin
            if(i==Address) begin
                busy_return[Address]<=frameo_n;
            end
            else busy_return[i]<=!frameo_n;
        end
    end
endmodule
