`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2024 10:41:41 PM
// Design Name: 
// Module Name: Router16x1
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


module Router16x1(
    input reset_n,clk,
    input [15:0] din,valid_n,frame_n,
    output [15:0] dout, valido_n,frameo_n
    );
    wire [3:0] Address,Address1,Address15;
    wire [15:0] busy,busy1,busy2,busy3,busy4,busy5,busy6,busy7,busy8,busy9,busy10,busy11,busy12,busy13,busy14,busy15;//đối với module Router_fsm
    wire [15:0] busy_arbiter,busy_arbiter1,busy_arbiter2,busy_arbiter3,busy_arbiter4,busy_arbiter5,busy_arbiter6,busy_arbiter7,busy_arbiter8,busy_arbiter9,busy_arbiter10,busy_arbiter11,busy_arbiter12,busy_arbiter13,busy_arbiter14,busy_arbiter15;//đối với module Arbiter
    wire [15:0] dout0,dout1,dout2,dout3,dout4,dout5,dout6,dout7,dout8,dout9,dout10,dout11,dout12,dout13,dout14,dout15;
    wire [15:0] din_Arbiter,din_Arbiter1,din_Arbiter2,din_Arbiter3,din_Arbiter4,din_Arbiter5,din_Arbiter6,din_Arbiter7,din_Arbiter8,din_Arbiter9,din_Arbiter10,din_Arbiter11,din_Arbiter12,din_Arbiter13,din_Arbiter14,din_Arbiter15;
    wire [15:0] frame_Arbiter,frame_Arbiter1,frame_Arbiter2,frame_Arbiter3,frame_Arbiter4,frame_Arbiter5,frame_Arbiter6,frame_Arbiter7,frame_Arbiter8,frame_Arbiter9,frame_Arbiter10,frame_Arbiter11,frame_Arbiter12,frame_Arbiter13,frame_Arbiter14,frame_Arbiter15;
    wire [15:0] valid_Arbiter,valid_Arbiter1,valid_Arbiter2,valid_Arbiter3,valid_Arbiter4,valid_Arbiter5,valid_Arbiter6,valid_Arbiter7,valid_Arbiter8,valid_Arbiter9,valid_Arbiter10,valid_Arbiter11,valid_Arbiter12,valid_Arbiter13,valid_Arbiter14,valid_Arbiter15;
    
    Router_fsm DUT0(.clk(clk),.reset_n(reset_n),.din(din[0]),.valid_n(valid_n[0]),.frame_n(frame_n[0]),.dout(dout0),.busy(busy),.Address(Address));
    Router_fsm DUT1(.clk(clk),.reset_n(reset_n),.din(din[1]),.valid_n(valid_n[1]),.frame_n(frame_n[1]),.dout(dout1),.busy(busy1),.Address(Address1));
    Router_fsm DUT2(.clk(clk),.reset_n(reset_n),.din(din[2]),.valid_n(valid_n[2]),.frame_n(frame_n[2]),.dout(dout2),.busy(busy2));
    Router_fsm DUT3(.clk(clk),.reset_n(reset_n),.din(din[3]),.valid_n(valid_n[3]),.frame_n(frame_n[3]),.dout(dout3),.busy(busy3));
    Router_fsm DUT4(.clk(clk),.reset_n(reset_n),.din(din[4]),.valid_n(valid_n[4]),.frame_n(frame_n[4]),.dout(dout4),.busy(busy4));
    Router_fsm DUT5(.clk(clk),.reset_n(reset_n),.din(din[5]),.valid_n(valid_n[5]),.frame_n(frame_n[5]),.dout(dout5),.busy(busy5));
    Router_fsm DUT6(.clk(clk),.reset_n(reset_n),.din(din[6]),.valid_n(valid_n[6]),.frame_n(frame_n[6]),.dout(dout6),.busy(busy6));
    Router_fsm DUT7(.clk(clk),.reset_n(reset_n),.din(din[7]),.valid_n(valid_n[7]),.frame_n(frame_n[7]),.dout(dout7),.busy(busy7));
    Router_fsm DUT8(.clk(clk),.reset_n(reset_n),.din(din[8]),.valid_n(valid_n[8]),.frame_n(frame_n[8]),.dout(dout8),.busy(busy8));
    Router_fsm DUT9(.clk(clk),.reset_n(reset_n),.din(din[9]),.valid_n(valid_n[9]),.frame_n(frame_n[9]),.dout(dout9),.busy(busy9));
    Router_fsm DUT10(.clk(clk),.reset_n(reset_n),.din(din[10]),.valid_n(valid_n[10]),.frame_n(frame_n[10]),.dout(dout10),.busy(busy10));
    Router_fsm DUT11(.clk(clk),.reset_n(reset_n),.din(din[11]),.valid_n(valid_n[11]),.frame_n(frame_n[11]),.dout(dout11),.busy(busy11));
    Router_fsm DUT12(.clk(clk),.reset_n(reset_n),.din(din[12]),.valid_n(valid_n[12]),.frame_n(frame_n[12]),.dout(dout12),.busy(busy12));
    Router_fsm DUT13(.clk(clk),.reset_n(reset_n),.din(din[13]),.valid_n(valid_n[13]),.frame_n(frame_n[13]),.dout(dout13),.busy(busy13));
    Router_fsm DUT14(.clk(clk),.reset_n(reset_n),.din(din[14]),.valid_n(valid_n[14]),.frame_n(frame_n[14]),.dout(dout14),.busy(busy14));
    Router_fsm DUT15(.clk(clk),.reset_n(reset_n),.din(din[15]),.valid_n(valid_n[15]),.frame_n(frame_n[15]),.dout(dout15),.busy(busy15),.Address(Address15));
    
    Arbiter ADUT(.Address(Address),.Address_const(4'b0000),.valid(valid_Arbiter),.frame(frame_Arbiter),.din(din_Arbiter),.busy(busy_arbiter),.valido_n(valido_n),.frameo_n(frameo_n),.dout(dout[0]));
    Arbiter ADUT1(.valid(valid_Arbiter1),.frame(frame_Arbiter1),.din(din_Arbiter1),.busy(busy_arbiter1),.valido_n(valido_n[1]),.frameo_n(frameo_n[1]),.dout(dout[1]));
    Arbiter ADUT2(.valid(valid_Arbiter2),.frame(frame_Arbiter2),.din(din_Arbiter2),.busy(busy_arbiter2),.valido_n(valido_n[2]),.frameo_n(frameo_n[2]),.dout(dout[2]));
    Arbiter ADUT3(.valid(valid_Arbiter3),.frame(frame_Arbiter3),.din(din_Arbiter3),.busy(busy_arbiter3),.valido_n(valido_n[3]),.frameo_n(frameo_n[3]),.dout(dout[3]));
    Arbiter ADUT4(.valid(valid_Arbiter4),.frame(frame_Arbiter4),.din(din_Arbiter4),.busy(busy_arbiter4),.valido_n(valido_n[4]),.frameo_n(frameo_n[4]),.dout(dout[4]));
    Arbiter ADUT5(.valid(valid_Arbiter5),.frame(frame_Arbiter5),.din(din_Arbiter5),.busy(busy_arbiter5),.valido_n(valido_n[5]),.frameo_n(frameo_n[5]),.dout(dout[5]));
    Arbiter ADUT6(.valid(valid_Arbiter6),.frame(frame_Arbiter6),.din(din_Arbiter6),.busy(busy_arbiter6),.valido_n(valido_n[6]),.frameo_n(frameo_n[6]),.dout(dout[6]));
    Arbiter ADUT7(.valid(valid_Arbiter7),.frame(frame_Arbiter7),.din(din_Arbiter7),.busy(busy_arbiter7),.valido_n(valido_n[7]),.frameo_n(frameo_n[7]),.dout(dout[7]));
    Arbiter ADUT8(.valid(valid_Arbiter8),.frame(frame_Arbiter8),.din(din_Arbiter8),.busy(busy_arbiter8),.valido_n(valido_n[8]),.frameo_n(frameo_n[8]),.dout(dout[8]));
    Arbiter ADUT9(.valid(valid_Arbiter9),.frame(frame_Arbiter9),.din(din_Arbiter9),.busy(busy_arbiter9),.valido_n(valido_n[9]),.frameo_n(frameo_n[9]),.dout(dout[9]));
    Arbiter ADUT10(.valid(valid_Arbiter10),.frame(frame_Arbiter10),.din(din_Arbiter10),.busy(busy_arbiter10),.valido_n(valido_n[10]),.frameo_n(frameo_n[10]),.dout(dout[10]));
    Arbiter ADUT11(.valid(valid_Arbiter11),.frame(frame_Arbiter11),.din(din_Arbiter11),.busy(busy_arbiter11),.valido_n(valido_n[11]),.frameo_n(frameo_n[11]),.dout(dout[11]));
    Arbiter ADUT12(.valid(valid_Arbiter12),.frame(frame_Arbiter12),.din(din_Arbiter12),.busy(busy_arbiter12),.valido_n(valido_n[12]),.frameo_n(frameo_n[12]),.dout(dout[12]));
    Arbiter ADUT13(.valid(valid_Arbiter13),.frame(frame_Arbiter13),.din(din_Arbiter13),.busy(busy_arbiter13),.valido_n(valido_n[13]),.frameo_n(frameo_n[13]),.dout(dout[13]));
    Arbiter ADUT14(.valid(valid_Arbiter14),.frame(frame_Arbiter14),.din(din_Arbiter14),.busy(busy_arbiter14),.valido_n(valido_n[14]),.frameo_n(frameo_n[14]),.dout(dout[14]));
    Arbiter ADUT15(.Address(Address15),.Address_const(4'b1111),.valid(valid_Arbiter15),.frame(frame_Arbiter15),.din(din_Arbiter15),.busy(busy_arbiter15),.valido_n(valido_n[15]),.frameo_n(frameo_n[15]),.dout(dout[15]));
    
    assign din_Arbiter[0]=dout0[0];
    assign din_Arbiter[1]=dout1[0];
    assign din_Arbiter[2]=dout2[0];
    assign din_Arbiter[3]=dout3[0];
    assign din_Arbiter[4]=dout4[0];
    assign din_Arbiter[5]=dout5[0];
    assign din_Arbiter[6]=dout6[0];
    assign din_Arbiter[7]=dout7[0];
    assign din_Arbiter[8]=dout8[0];
    assign din_Arbiter[9]=dout9[0];
    assign din_Arbiter[10]=dout10[0];
    assign din_Arbiter[11]=dout11[0];
    assign din_Arbiter[12]=dout12[0];
    assign din_Arbiter[13]=dout13[0];
    assign din_Arbiter[14]=dout14[0];
    assign din_Arbiter[15]=dout15[0];
    
    assign din_Arbiter1[0]=dout0[1];
    assign din_Arbiter1[1]=dout1[1];
    assign din_Arbiter1[2]=dout2[1];
    assign din_Arbiter1[3]=dout3[1];
    assign din_Arbiter1[4]=dout4[1];
    assign din_Arbiter1[5]=dout5[1];
    assign din_Arbiter1[6]=dout6[1];
    assign din_Arbiter1[7]=dout7[1];
    assign din_Arbiter1[8]=dout8[1];
    assign din_Arbiter1[9]=dout9[1];
    assign din_Arbiter1[10]=dout10[1];
    assign din_Arbiter1[11]=dout11[1];
    assign din_Arbiter1[12]=dout12[1];
    assign din_Arbiter1[13]=dout13[1];
    assign din_Arbiter1[14]=dout14[1];
    assign din_Arbiter1[15]=dout15[1];

    assign din_Arbiter2[0]=dout0[2];
    assign din_Arbiter2[1]=dout1[2];
    assign din_Arbiter2[2]=dout2[2];
    assign din_Arbiter2[3]=dout3[2];
    assign din_Arbiter2[4]=dout4[2];
    assign din_Arbiter2[5]=dout5[2];
    assign din_Arbiter2[6]=dout6[2];
    assign din_Arbiter2[7]=dout7[2];
    assign din_Arbiter2[8]=dout8[2];
    assign din_Arbiter2[9]=dout9[2];
    assign din_Arbiter2[10]=dout10[2];
    assign din_Arbiter2[11]=dout11[2];
    assign din_Arbiter2[12]=dout12[2];
    assign din_Arbiter2[13]=dout13[2];
    assign din_Arbiter2[14]=dout14[2];
    assign din_Arbiter2[15]=dout15[2];

    assign din_Arbiter3[0]=dout0[3];
    assign din_Arbiter3[1]=dout1[3];
    assign din_Arbiter3[2]=dout2[3];
    assign din_Arbiter3[3]=dout3[3];
    assign din_Arbiter3[4]=dout4[3];
    assign din_Arbiter3[5]=dout5[3];
    assign din_Arbiter3[6]=dout6[3];
    assign din_Arbiter3[7]=dout7[3];
    assign din_Arbiter3[8]=dout8[3];
    assign din_Arbiter3[9]=dout9[3];
    assign din_Arbiter3[10]=dout10[3];
    assign din_Arbiter3[11]=dout11[3];
    assign din_Arbiter3[12]=dout12[3];
    assign din_Arbiter3[13]=dout13[3];
    assign din_Arbiter3[14]=dout14[3];
    assign din_Arbiter3[15]=dout15[3];

    assign din_Arbiter4[0]=dout0[4];
    assign din_Arbiter4[1]=dout1[4];
    assign din_Arbiter4[2]=dout2[4];
    assign din_Arbiter4[3]=dout3[4];
    assign din_Arbiter4[4]=dout4[4];
    assign din_Arbiter4[5]=dout5[4];
    assign din_Arbiter4[6]=dout6[4];
    assign din_Arbiter4[7]=dout7[4];
    assign din_Arbiter4[8]=dout8[4];
    assign din_Arbiter4[9]=dout9[4];
    assign din_Arbiter4[10]=dout10[4];
    assign din_Arbiter4[11]=dout11[4];
    assign din_Arbiter4[12]=dout12[4];
    assign din_Arbiter4[13]=dout13[4];
    assign din_Arbiter4[14]=dout14[4];
    assign din_Arbiter4[15]=dout15[4];

    assign din_Arbiter5[0]=dout0[5];
    assign din_Arbiter5[1]=dout1[5];
    assign din_Arbiter5[2]=dout2[5];
    assign din_Arbiter5[3]=dout3[5];
    assign din_Arbiter5[4]=dout4[5];
    assign din_Arbiter5[5]=dout5[5];
    assign din_Arbiter5[6]=dout6[5];
    assign din_Arbiter5[7]=dout7[5];
    assign din_Arbiter5[8]=dout8[5];
    assign din_Arbiter5[9]=dout9[5];
    assign din_Arbiter5[10]=dout10[5];
    assign din_Arbiter5[11]=dout11[5];
    assign din_Arbiter5[12]=dout12[5];
    assign din_Arbiter5[13]=dout13[5];
    assign din_Arbiter5[14]=dout14[5];
    assign din_Arbiter5[15]=dout15[5];

    assign din_Arbiter6[0]=dout0[6];
    assign din_Arbiter6[1]=dout1[6];
    assign din_Arbiter6[2]=dout2[6];
    assign din_Arbiter6[3]=dout3[6];
    assign din_Arbiter6[4]=dout4[6];
    assign din_Arbiter6[5]=dout5[6];
    assign din_Arbiter6[6]=dout6[6];
    assign din_Arbiter6[7]=dout7[6];
    assign din_Arbiter6[8]=dout8[6];
    assign din_Arbiter6[9]=dout9[6];
    assign din_Arbiter6[10]=dout10[6];
    assign din_Arbiter6[11]=dout11[6];
    assign din_Arbiter6[12]=dout12[6];
    assign din_Arbiter6[13]=dout13[6];
    assign din_Arbiter6[14]=dout14[6];
    assign din_Arbiter6[15]=dout15[6];

    assign din_Arbiter7[0]=dout0[7];
    assign din_Arbiter7[1]=dout1[7];
    assign din_Arbiter7[2]=dout2[7];
    assign din_Arbiter7[3]=dout3[7];
    assign din_Arbiter7[4]=dout4[7];
    assign din_Arbiter7[5]=dout5[7];
    assign din_Arbiter7[6]=dout6[7];
    assign din_Arbiter7[7]=dout7[7];
    assign din_Arbiter7[8]=dout8[7];
    assign din_Arbiter7[9]=dout9[7];
    assign din_Arbiter7[10]=dout10[7];
    assign din_Arbiter7[11]=dout11[7];
    assign din_Arbiter7[12]=dout12[7];
    assign din_Arbiter7[13]=dout13[7];
    assign din_Arbiter7[14]=dout14[7];
    assign din_Arbiter7[15]=dout15[7];

    assign din_Arbiter8[0]=dout0[8];
    assign din_Arbiter8[1]=dout1[8];
    assign din_Arbiter8[2]=dout2[8];
    assign din_Arbiter8[3]=dout3[8];
    assign din_Arbiter8[4]=dout4[8];
    assign din_Arbiter8[5]=dout5[8];
    assign din_Arbiter8[6]=dout6[8];
    assign din_Arbiter8[7]=dout7[8];
    assign din_Arbiter8[8]=dout8[8];
    assign din_Arbiter8[9]=dout9[8];
    assign din_Arbiter8[10]=dout10[8];
    assign din_Arbiter8[11]=dout11[8];
    assign din_Arbiter8[12]=dout12[8];
    assign din_Arbiter8[13]=dout13[8];
    assign din_Arbiter8[14]=dout14[8];
    assign din_Arbiter8[15]=dout15[8];

    assign din_Arbiter9[0]=dout0[9];
    assign din_Arbiter9[1]=dout1[9];
    assign din_Arbiter9[2]=dout2[9];
    assign din_Arbiter9[3]=dout3[9];
    assign din_Arbiter9[4]=dout4[9];
    assign din_Arbiter9[5]=dout5[9];
    assign din_Arbiter9[6]=dout6[9];
    assign din_Arbiter9[7]=dout7[9];
    assign din_Arbiter9[8]=dout8[9];
    assign din_Arbiter9[9]=dout9[9];
    assign din_Arbiter9[10]=dout10[9];
    assign din_Arbiter9[11]=dout11[9];
    assign din_Arbiter9[12]=dout12[9];
    assign din_Arbiter9[13]=dout13[9];
    assign din_Arbiter9[14]=dout14[9];
    assign din_Arbiter9[15]=dout15[9];

    assign din_Arbiter10[0]=dout0[10];
    assign din_Arbiter10[1]=dout1[10];
    assign din_Arbiter10[2]=dout2[10];
    assign din_Arbiter10[3]=dout3[10];
    assign din_Arbiter10[4]=dout4[10];
    assign din_Arbiter10[5]=dout5[10];
    assign din_Arbiter10[6]=dout6[10];
    assign din_Arbiter10[7]=dout7[10];
    assign din_Arbiter10[8]=dout8[10];
    assign din_Arbiter10[9]=dout9[10];
    assign din_Arbiter10[10]=dout10[10];
    assign din_Arbiter10[11]=dout11[10];
    assign din_Arbiter10[12]=dout12[10];
    assign din_Arbiter10[13]=dout13[10];
    assign din_Arbiter10[14]=dout14[10];
    assign din_Arbiter10[15]=dout15[10];

    assign din_Arbiter11[0]=dout0[11];
    assign din_Arbiter11[1]=dout1[11];
    assign din_Arbiter11[2]=dout2[11];
    assign din_Arbiter11[3]=dout3[11];
    assign din_Arbiter11[4]=dout4[11];
    assign din_Arbiter11[5]=dout5[11];
    assign din_Arbiter11[6]=dout6[11];
    assign din_Arbiter11[7]=dout7[11];
    assign din_Arbiter11[8]=dout8[11];
    assign din_Arbiter11[9]=dout9[11];
    assign din_Arbiter11[10]=dout10[11];
    assign din_Arbiter11[11]=dout11[11];
    assign din_Arbiter11[12]=dout12[11];
    assign din_Arbiter11[13]=dout13[11];
    assign din_Arbiter11[14]=dout14[11];
    assign din_Arbiter11[15]=dout15[11];

    assign din_Arbiter12[0]=dout0[12];
    assign din_Arbiter12[1]=dout1[12];
    assign din_Arbiter12[2]=dout2[12];
    assign din_Arbiter12[3]=dout3[12];
    assign din_Arbiter12[4]=dout4[12];
    assign din_Arbiter12[5]=dout5[12];
    assign din_Arbiter12[6]=dout6[12];
    assign din_Arbiter12[7]=dout7[12];
    assign din_Arbiter12[8]=dout8[12];
    assign din_Arbiter12[9]=dout9[12];
    assign din_Arbiter12[10]=dout10[12];
    assign din_Arbiter12[11]=dout11[12];
    assign din_Arbiter12[12]=dout12[12];
    assign din_Arbiter12[13]=dout13[12];
    assign din_Arbiter12[14]=dout14[12];
    assign din_Arbiter12[15]=dout15[12];

    assign din_Arbiter13[0]=dout0[13];
    assign din_Arbiter13[1]=dout1[13];
    assign din_Arbiter13[2]=dout2[13];
    assign din_Arbiter13[3]=dout3[13];
    assign din_Arbiter13[4]=dout4[13];
    assign din_Arbiter13[5]=dout5[13];
    assign din_Arbiter13[6]=dout6[13];
    assign din_Arbiter13[7]=dout7[13];
    assign din_Arbiter13[8]=dout8[13];
    assign din_Arbiter13[9]=dout9[13];
    assign din_Arbiter13[10]=dout10[13];
    assign din_Arbiter13[11]=dout11[13];
    assign din_Arbiter13[12]=dout12[13];
    assign din_Arbiter13[13]=dout13[13];
    assign din_Arbiter13[14]=dout14[13];
    assign din_Arbiter13[15]=dout15[13];

    assign din_Arbiter14[0]=dout0[14];
    assign din_Arbiter14[1]=dout1[14];
    assign din_Arbiter14[2]=dout2[14];
    assign din_Arbiter14[3]=dout3[14];
    assign din_Arbiter14[4]=dout4[14];
    assign din_Arbiter14[5]=dout5[14];
    assign din_Arbiter14[6]=dout6[14];
    assign din_Arbiter14[7]=dout7[14];
    assign din_Arbiter14[8]=dout8[14];
    assign din_Arbiter14[9]=dout9[14];
    assign din_Arbiter14[10]=dout10[14];
    assign din_Arbiter14[11]=dout11[14];
    assign din_Arbiter14[12]=dout12[14];
    assign din_Arbiter14[13]=dout13[14];
    assign din_Arbiter14[14]=dout14[14];
    assign din_Arbiter14[15]=dout15[14];

    assign din_Arbiter15[0]=dout0[15];
    assign din_Arbiter15[1]=dout1[15];
    assign din_Arbiter15[2]=dout2[15];
    assign din_Arbiter15[3]=dout3[15];
    assign din_Arbiter15[4]=dout4[15];
    assign din_Arbiter15[5]=dout5[15];
    assign din_Arbiter15[6]=dout6[15];
    assign din_Arbiter15[7]=dout7[15];
    assign din_Arbiter15[8]=dout8[15];
    assign din_Arbiter15[9]=dout9[15];
    assign din_Arbiter15[10]=dout10[15];
    assign din_Arbiter15[11]=dout11[15];
    assign din_Arbiter15[12]=dout12[15];
    assign din_Arbiter15[13]=dout13[15];
    assign din_Arbiter15[14]=dout14[15];
    assign din_Arbiter15[15]=dout15[15];
    
    assign busy[0]=busy_arbiter[0];
    assign busy1[0]=busy_arbiter[1];
    assign busy2[0]=busy_arbiter[2];
    assign busy3[0]=busy_arbiter[3];
    assign busy4[0]=busy_arbiter[4];
    assign busy5[0]=busy_arbiter[5];
    assign busy6[0]=busy_arbiter[6];
    assign busy7[0]=busy_arbiter[7];
    assign busy8[0]=busy_arbiter[8];
    assign busy9[0]=busy_arbiter[9];
    assign busy10[0]=busy_arbiter[10];
    assign busy11[0]=busy_arbiter[11];
    assign busy12[0]=busy_arbiter[12];
    assign busy13[0]=busy_arbiter[13];
    assign busy14[0]=busy_arbiter[14];
    assign busy15[0]=busy_arbiter[15];
    
    assign busy[1]=busy_arbiter1[0];
    assign busy1[1]=busy_arbiter1[1];
    assign busy2[1]=busy_arbiter1[2];
    assign busy3[1]=busy_arbiter1[3];
    assign busy4[1]=busy_arbiter1[4];
    assign busy5[1]=busy_arbiter1[5];
    assign busy6[1]=busy_arbiter1[6];
    assign busy7[1]=busy_arbiter1[7];
    assign busy8[1]=busy_arbiter1[8];
    assign busy9[1]=busy_arbiter1[9];
    assign busy10[1]=busy_arbiter1[10];
    assign busy11[1]=busy_arbiter1[11];
    assign busy12[1]=busy_arbiter1[12];
    assign busy13[1]=busy_arbiter1[13];
    assign busy14[1]=busy_arbiter1[14];
    assign busy15[1]=busy_arbiter1[15];

    assign busy[2]=busy_arbiter2[0];
    assign busy1[2]=busy_arbiter2[1];
    assign busy2[2]=busy_arbiter2[2];
    assign busy3[2]=busy_arbiter2[3];
    assign busy4[2]=busy_arbiter2[4];
    assign busy5[2]=busy_arbiter2[5];
    assign busy6[2]=busy_arbiter2[6];
    assign busy7[2]=busy_arbiter2[7];
    assign busy8[2]=busy_arbiter2[8];
    assign busy9[2]=busy_arbiter2[9];
    assign busy10[2]=busy_arbiter2[10];
    assign busy11[2]=busy_arbiter2[11];
    assign busy12[2]=busy_arbiter2[12];
    assign busy13[2]=busy_arbiter2[13];
    assign busy14[2]=busy_arbiter2[14];
    assign busy15[2]=busy_arbiter2[15];

    assign busy[3]=busy_arbiter3[0];
    assign busy1[3]=busy_arbiter3[1];
    assign busy2[3]=busy_arbiter3[2];
    assign busy3[3]=busy_arbiter3[3];
    assign busy4[3]=busy_arbiter3[4];
    assign busy5[3]=busy_arbiter3[5];
    assign busy6[3]=busy_arbiter3[6];
    assign busy7[3]=busy_arbiter3[7];
    assign busy8[3]=busy_arbiter3[8];
    assign busy9[3]=busy_arbiter3[9];
    assign busy10[3]=busy_arbiter3[10];
    assign busy11[3]=busy_arbiter3[11];
    assign busy12[3]=busy_arbiter3[12];
    assign busy13[3]=busy_arbiter3[13];
    assign busy14[3]=busy_arbiter3[14];
    assign busy15[3]=busy_arbiter3[15];

    assign busy[4]=busy_arbiter4[0];
    assign busy1[4]=busy_arbiter4[1];
    assign busy2[4]=busy_arbiter4[2];
    assign busy3[4]=busy_arbiter4[3];
    assign busy4[4]=busy_arbiter4[4];
    assign busy5[4]=busy_arbiter4[5];
    assign busy6[4]=busy_arbiter4[6];
    assign busy7[4]=busy_arbiter4[7];
    assign busy8[4]=busy_arbiter4[8];
    assign busy9[4]=busy_arbiter4[9];
    assign busy10[4]=busy_arbiter4[10];
    assign busy11[4]=busy_arbiter4[11];
    assign busy12[4]=busy_arbiter4[12];
    assign busy13[4]=busy_arbiter4[13];
    assign busy14[4]=busy_arbiter4[14];
    assign busy15[4]=busy_arbiter4[15];

    assign busy[5]=busy_arbiter5[0];
    assign busy1[5]=busy_arbiter5[1];
    assign busy2[5]=busy_arbiter5[2];
    assign busy3[5]=busy_arbiter5[3];
    assign busy4[5]=busy_arbiter5[4];
    assign busy5[5]=busy_arbiter5[5];
    assign busy6[5]=busy_arbiter5[6];
    assign busy7[5]=busy_arbiter5[7];
    assign busy8[5]=busy_arbiter5[8];
    assign busy9[5]=busy_arbiter5[9];
    assign busy10[5]=busy_arbiter5[10];
    assign busy11[5]=busy_arbiter5[11];
    assign busy12[5]=busy_arbiter5[12];
    assign busy13[5]=busy_arbiter5[13];
    assign busy14[5]=busy_arbiter5[14];
    assign busy15[5]=busy_arbiter5[15];

    assign busy[6]=busy_arbiter6[0];
    assign busy1[6]=busy_arbiter6[1];
    assign busy2[6]=busy_arbiter6[2];
    assign busy3[6]=busy_arbiter6[3];
    assign busy4[6]=busy_arbiter6[4];
    assign busy5[6]=busy_arbiter6[5];
    assign busy6[6]=busy_arbiter6[6];
    assign busy7[6]=busy_arbiter6[7];
    assign busy8[6]=busy_arbiter6[8];
    assign busy9[6]=busy_arbiter6[9];
    assign busy10[6]=busy_arbiter6[10];
    assign busy11[6]=busy_arbiter6[11];
    assign busy12[6]=busy_arbiter6[12];
    assign busy13[6]=busy_arbiter6[13];
    assign busy14[6]=busy_arbiter6[14];
    assign busy15[6]=busy_arbiter6[15];

    assign busy[7]=busy_arbiter7[0];
    assign busy1[7]=busy_arbiter7[1];
    assign busy2[7]=busy_arbiter7[2];
    assign busy3[7]=busy_arbiter7[3];
    assign busy4[7]=busy_arbiter7[4];
    assign busy5[7]=busy_arbiter7[5];
    assign busy6[7]=busy_arbiter7[6];
    assign busy7[7]=busy_arbiter7[7];
    assign busy8[7]=busy_arbiter7[8];
    assign busy9[7]=busy_arbiter7[9];
    assign busy10[7]=busy_arbiter7[10];
    assign busy11[7]=busy_arbiter7[11];
    assign busy12[7]=busy_arbiter7[12];
    assign busy13[7]=busy_arbiter7[13];
    assign busy14[7]=busy_arbiter7[14];
    assign busy15[7]=busy_arbiter7[15];

    assign busy[8]=busy_arbiter8[0];
    assign busy1[8]=busy_arbiter8[1];
    assign busy2[8]=busy_arbiter8[2];
    assign busy3[8]=busy_arbiter8[3];
    assign busy4[8]=busy_arbiter8[4];
    assign busy5[8]=busy_arbiter8[5];
    assign busy6[8]=busy_arbiter8[6];
    assign busy7[8]=busy_arbiter8[7];
    assign busy8[8]=busy_arbiter8[8];
    assign busy9[8]=busy_arbiter8[9];
    assign busy10[8]=busy_arbiter8[10];
    assign busy11[8]=busy_arbiter8[11];
    assign busy12[8]=busy_arbiter8[12];
    assign busy13[8]=busy_arbiter8[13];
    assign busy14[8]=busy_arbiter8[14];
    assign busy15[8]=busy_arbiter8[15];

    assign busy[9]=busy_arbiter9[0];
    assign busy1[9]=busy_arbiter9[1];
    assign busy2[9]=busy_arbiter9[2];
    assign busy3[9]=busy_arbiter9[3];
    assign busy4[9]=busy_arbiter9[4];
    assign busy5[9]=busy_arbiter9[5];
    assign busy6[9]=busy_arbiter9[6];
    assign busy7[9]=busy_arbiter9[7];
    assign busy8[9]=busy_arbiter9[8];
    assign busy9[9]=busy_arbiter9[9];
    assign busy10[9]=busy_arbiter9[10];
    assign busy11[9]=busy_arbiter9[11];
    assign busy12[9]=busy_arbiter9[12];
    assign busy13[9]=busy_arbiter9[13];
    assign busy14[9]=busy_arbiter9[14];
    assign busy15[9]=busy_arbiter9[15];

    assign busy[10]=busy_arbiter10[0];
    assign busy1[10]=busy_arbiter10[1];
    assign busy2[10]=busy_arbiter10[2];
    assign busy3[10]=busy_arbiter10[3];
    assign busy4[10]=busy_arbiter10[4];
    assign busy5[10]=busy_arbiter10[5];
    assign busy6[10]=busy_arbiter10[6];
    assign busy7[10]=busy_arbiter10[7];
    assign busy8[10]=busy_arbiter10[8];
    assign busy9[10]=busy_arbiter10[9];
    assign busy10[10]=busy_arbiter10[10];
    assign busy11[10]=busy_arbiter10[11];
    assign busy12[10]=busy_arbiter10[12];
    assign busy13[10]=busy_arbiter10[13];
    assign busy14[10]=busy_arbiter10[14];
    assign busy15[10]=busy_arbiter10[15];

    assign busy[11]=busy_arbiter11[0];
    assign busy1[11]=busy_arbiter11[1];
    assign busy2[11]=busy_arbiter11[2];
    assign busy3[11]=busy_arbiter11[3];
    assign busy4[11]=busy_arbiter11[4];
    assign busy5[11]=busy_arbiter11[5];
    assign busy6[11]=busy_arbiter11[6];
    assign busy7[11]=busy_arbiter11[7];
    assign busy8[11]=busy_arbiter11[8];
    assign busy9[11]=busy_arbiter11[9];
    assign busy10[11]=busy_arbiter11[10];
    assign busy11[11]=busy_arbiter11[11];
    assign busy12[11]=busy_arbiter11[12];
    assign busy13[11]=busy_arbiter11[13];
    assign busy14[11]=busy_arbiter11[14];
    assign busy15[11]=busy_arbiter11[15];

    assign busy[12]=busy_arbiter12[0];
    assign busy1[12]=busy_arbiter12[1];
    assign busy2[12]=busy_arbiter12[2];
    assign busy3[12]=busy_arbiter12[3];
    assign busy4[12]=busy_arbiter12[4];
    assign busy5[12]=busy_arbiter12[5];
    assign busy6[12]=busy_arbiter12[6];
    assign busy7[12]=busy_arbiter12[7];
    assign busy8[12]=busy_arbiter12[8];
    assign busy9[12]=busy_arbiter12[9];
    assign busy10[12]=busy_arbiter12[10];
    assign busy11[12]=busy_arbiter12[11];
    assign busy12[12]=busy_arbiter12[12];
    assign busy13[12]=busy_arbiter12[13];
    assign busy14[12]=busy_arbiter12[14];
    assign busy15[12]=busy_arbiter12[15];

    assign busy[13]=busy_arbiter13[0];
    assign busy1[13]=busy_arbiter13[1];
    assign busy2[13]=busy_arbiter13[2];
    assign busy3[13]=busy_arbiter13[3];
    assign busy4[13]=busy_arbiter13[4];
    assign busy5[13]=busy_arbiter13[5];
    assign busy6[13]=busy_arbiter13[6];
    assign busy7[13]=busy_arbiter13[7];
    assign busy8[13]=busy_arbiter13[8];
    assign busy9[13]=busy_arbiter13[9];
    assign busy10[13]=busy_arbiter13[10];
    assign busy11[13]=busy_arbiter13[11];
    assign busy12[13]=busy_arbiter13[12];
    assign busy13[13]=busy_arbiter13[13];
    assign busy14[13]=busy_arbiter13[14];
    assign busy15[13]=busy_arbiter13[15];

    assign busy[14]=busy_arbiter14[0];
    assign busy1[14]=busy_arbiter14[1];
    assign busy2[14]=busy_arbiter14[2];
    assign busy3[14]=busy_arbiter14[3];
    assign busy4[14]=busy_arbiter14[4];
    assign busy5[14]=busy_arbiter14[5];
    assign busy6[14]=busy_arbiter14[6];
    assign busy7[14]=busy_arbiter14[7];
    assign busy8[14]=busy_arbiter14[8];
    assign busy9[14]=busy_arbiter14[9];
    assign busy10[14]=busy_arbiter14[10];
    assign busy11[14]=busy_arbiter14[11];
    assign busy12[14]=busy_arbiter14[12];
    assign busy13[14]=busy_arbiter14[13];
    assign busy14[14]=busy_arbiter14[14];
    assign busy15[14]=busy_arbiter14[15];

    assign busy[15]=busy_arbiter15[0];
    assign busy1[15]=busy_arbiter15[1];
    assign busy2[15]=busy_arbiter15[2];
    assign busy3[15]=busy_arbiter15[3];
    assign busy4[15]=busy_arbiter15[4];
    assign busy5[15]=busy_arbiter15[5];
    assign busy6[15]=busy_arbiter15[6];
    assign busy7[15]=busy_arbiter15[7];
    assign busy8[15]=busy_arbiter15[8];
    assign busy9[15]=busy_arbiter15[9];
    assign busy10[15]=busy_arbiter15[10];
    assign busy11[15]=busy_arbiter15[11];
    assign busy12[15]=busy_arbiter15[12];
    assign busy13[15]=busy_arbiter15[13];
    assign busy14[15]=busy_arbiter15[14];
    assign busy15[15]=busy_arbiter15[15];

    assign frame_Arbiter=frame_n;
    assign valid_Arbiter=valid_n;
    assign frame_Arbiter15=frame_n;
    assign valid_Arbiter15=valid_n;
endmodule
