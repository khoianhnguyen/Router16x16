`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2024 10:55:13 PM
// Design Name: 
// Module Name: Arbiter_router
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


module Arbiter_router(
    input reset_n,
    input [15:0] din,valid_n,frame_n,
    output reg [15:0] busy,
    output reg frameo_n,valido_n,dout
    );
    reg [15:0] grant_reg,pre_grant;
    integer  i,j;
    bit exit;
    always @(*) begin
        if(!reset_n) begin
        pre_grant=frame_n|16'hffff; 
        end
            grant_reg[0]=pre_grant[0]|frame_n[0];
            grant_reg[1]=pre_grant[1]|frame_n[1];
            grant_reg[2]=pre_grant[2]|frame_n[2];
            grant_reg[3]=pre_grant[3]|frame_n[3];
            grant_reg[4]=pre_grant[4]|frame_n[4];
            grant_reg[5]=pre_grant[5]|frame_n[5];
            grant_reg[6]=pre_grant[6]|frame_n[6];
            grant_reg[7]=pre_grant[7]|frame_n[7];
            grant_reg[8]=pre_grant[8]|frame_n[8];
            grant_reg[9]=pre_grant[9]|frame_n[9];
            grant_reg[10]=pre_grant[10]|frame_n[10];
            grant_reg[11]=pre_grant[11]|frame_n[11];
            grant_reg[12]=pre_grant[12]|frame_n[12];
            grant_reg[13]=pre_grant[13]|frame_n[13];
            grant_reg[14]=pre_grant[14]|frame_n[14];
            grant_reg[15]=pre_grant[15]|frame_n[15];
            if(grant_reg==16'hffff) begin
                for(i=0;i<=15;i=i+1)begin
                    if(frame_n[i]==0) begin
                    grant_reg[i]=1'b0;
                    break;
                    end
                end
            end
            for (i=0;i<=15;i=i+1) begin
                if (grant_reg[i]==0) break;
            end
            pre_grant=grant_reg;                            
    end
    assign busy=grant_reg;
    assign frameo_n=(grant_reg!=16'hffff)?frame_n[i]:1'bx;
    assign valido_n=(grant_reg!=16'hffff)?valid_n[i]:1'bx;
    assign dout=(grant_reg!=16'hffff)? din[i]:1'bx;
endmodule
