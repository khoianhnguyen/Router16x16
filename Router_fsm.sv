`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2024 10:32:34 PM
// Design Name: 
// Module Name: Router_fsm
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


module Router_fsm(
    input clk,reset_n,frame_n,valid_n,din,
    input [15:0] busy,
    output reg [15:0] dout,
    output reg [3:0] Addr
    );
    reg [3:0] Address;
    reg [4:0] reset_reg=0;
    reg [2:0] address_counter=0;
    reg [2:0] state,nextstate;
    parameter State_Reset=3'b000, State_Address=3'b001,State_Load_data=3'b010,State_Padding=3'b011,State_WaitingFrame=3'b100,State_Waitingvalid=3'b101;
    always @(frame_n or valid_n or busy or reset_reg or address_counter or Address or din or state) begin
    case(state) 
        State_Reset: begin 
            if(reset_n==0||reset_reg<15) begin
                nextstate<= State_Reset;
            end
            else if(reset_reg>=15 && frame_n==1) begin
                nextstate<= State_WaitingFrame;
            end
            else if (reset_reg>=15 &&frame_n==0) begin
                nextstate<= State_Address;
            end
            end
        State_WaitingFrame: begin
            if(frame_n==0) begin
                nextstate<= State_Address;
            end
            else if(frame_n==1) begin
                nextstate<= State_WaitingFrame;
            end
            end
        State_Address: begin
            if(frame_n==1) begin
                nextstate<= State_WaitingFrame;
            end
            else if(frame_n==0&& address_counter<3) begin
                nextstate<= State_Address;
            end
            else if(frame_n==0&&address_counter>3 && busy[Address]==1) begin
                nextstate<= State_Padding;
            end
            else if(frame_n==0&&address_counter>3 && busy[Address]==0) begin
                nextstate<= State_Load_data;
            end
            else if(frame_n==0 &&valid_n==1) begin
                nextstate<= State_Waitingvalid;
            end
        end
        State_Padding: begin
            if(frame_n==1) begin
                nextstate<=State_WaitingFrame;
            end
            else if(frame_n==0&&busy[Address]==0) begin
                nextstate<= State_Load_data;
            end
            else if(frame_n==0&&busy[Address]==1) begin
                nextstate<= State_Padding;
            end
        end
        State_Load_data: begin
            if(valid_n==1) begin
                nextstate<= State_Waitingvalid;
            end
            else if(frame_n==1) begin
                nextstate<= State_WaitingFrame;
            end
            else if(frame_n==0&&valid_n==0) begin
                nextstate<= State_Load_data;
            end
        end
        State_Waitingvalid: begin
            if(valid_n==0 &&address_counter<=3) begin
                nextstate<= State_Address;
            end
            else if(valid_n==0&& address_counter>3) begin  
                nextstate<= State_Load_data;
            end
            else if(valid_n==1) nextstate<= State_Waitingvalid;
            else if(frame_n==1) nextstate<= State_WaitingFrame;
        end
    endcase
    end
    always @(posedge clk) begin
        if(!reset_n) begin
            state<=State_Reset;
        end
        else if(state==State_Reset) begin
            if(reset_reg< 15) begin
                reset_reg<=reset_reg+1;
                state<=nextstate;
            end
            else begin
                reset_reg<=reset_reg;
                state<=nextstate;
            end
        end
        else if(state==State_WaitingFrame) begin
            dout[Address]<=1'bx;
            state<=nextstate;
            Address<=16'hxxxx;
            address_counter<=0;
            reset_reg<=0;
        end
        else if(state==State_Address) begin
            state<=nextstate;
            if (address_counter<=3) begin
                address_counter=address_counter+1;
                Address<={Address,din};
            end
            else begin
                address_counter<=address_counter;
                Address<=Address;
                end
        end
        else if(state==State_Padding) begin
            state<=nextstate;
            dout[Address]<=1'b1;
        end
        else if(state==State_Load_data) begin
            state<=nextstate;
            dout[Address]<=din; 
        end
        else if(state==State_Waitingvalid) begin
            state<=nextstate;
            dout[Address]<=1'bx;
        end
        else begin
            state<= nextstate;
        end
    end
    assign Addr=(state!=State_Address)? Address:4'bxxxx;
endmodule
