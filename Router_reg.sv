`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2024 09:53:52 PM
// Design Name: 
// Module Name: Router_reg
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


module Router_reg(
    input din,valid_n,frame_n,
    input clk,reset_n,
    output  reg dout,
    output reg [3:0] address
    );
//    logic [3:0] rst=0;
//    logic  [2:0] four_bit=0;
//    logic full=0;
//    always @(posedge clk) begin
//        if(!reset_n) begin
//        rst=0;
//        end
//        else begin
//        if (rst<=14) rst=rst+1;
//        else begin  
//                    if(!frame_n) begin
//                        if(full==0) begin
//                        address<={address,din};
//                        four_bit=four_bit+1;
//                        end
//                        if(four_bit>4) begin
//                        full =1;
//                        four_bit=0;
//                        end
//                        if(full==1 && valid_n==0}
//                        begin
//                            dout<=din;
//                            address<=address;
//                        end
//                    end
//             end
//    end
endmodule
