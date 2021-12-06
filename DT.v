module DT(
	input clk, 
	input reset,
	output reg done ,
	output reg sti_rd ,
	output reg [9:0] sti_addr ,
	input [15:0] sti_di,
	output reg res_wr ,
	output reg res_rd ,
	output reg [13:0] res_addr ,
	output reg [7:0] res_do,
	input [7:0]	res_di
);
//=========================================================
reg [3:0] state_cs,state_ns;
reg [3:0] cnt;
parameter ST_IDLE = 4'd0;  // to identify the object and background
parameter ST_NW = 4'd1;    // 
parameter ST_N = 4'd2;
parameter ST_NE = 4'd3;
parameter ST_W = 4'd4;
parameter ST_OD = 4'd5;
parameter ST_BG = 4'd6;    // store the background pixcel into res_RAM
parameter ST_FWD = 4'd7;
parameter ST_BW = 4'd8;
parameter ST_E = 4'd9;
parameter ST_SW = 4'd10;
parameter ST_S = 4'd11;
parameter ST_SE = 4'd12;
parameter ST_Pxy = 4'd13;
parameter ST_BG2 = 4'd14;
parameter ST_ALLD = 4'd15 ; 

always @(posedge clk or negedge reset) begin //state_cs
	if(!reset)
		state_cs <= ST_IDLE;
	else
		state_cs <= state_ns;
end

always @(*) begin	//state_ns
	state_ns = state_cs;
	case(state_cs)
		ST_IDLE : state_ns = (sti_di[15-cnt]) ? ST_NW : ST_BG;
		ST_BG : state_ns = (res_addr == 14'd16383) ? ST_FWD : ST_IDLE;
		ST_OD : state_ns = ST_IDLE;
		ST_BW : state_ns = res_di ? ST_E : ST_BG2;
		ST_Pxy : state_ns = ST_BW;
		ST_BG2 : state_ns = (res_addr==14'd0) ? ST_ALLD : ST_BW;
		default : state_ns = state_cs + 1;
	endcase
end

always @(posedge clk or negedge reset) begin //sti_rd
	if (!reset)
        sti_rd <= 1;
    else if(state_cs == ST_IDLE)
        sti_rd <= 0;
    else if(state_cs == ST_OD && cnt==15)
        sti_rd <= 1;
    else if(state_cs ==ST_BG && cnt==15)
        sti_rd <= 1;
    else if(state_cs == ST_FWD)
        sti_rd <= 0;
    
end

always @(posedge clk or negedge reset) begin  // cnt
	if(!reset)
        cnt <= 0;
    else if(state_cs == ST_BG)
        cnt <= cnt +1;
    else if(state_cs == ST_OD)
        cnt <= cnt +1;
end

always @(posedge clk or negedge reset) begin //sti_addr
	if(!reset)
		sti_addr <= 0;
    else if(state_cs == ST_BG && cnt==15)
        sti_addr <= sti_addr + 1;
    else if(state_cs == ST_OD && cnt==15)
        sti_addr <= sti_addr + 1;
end

always @(posedge clk or negedge reset) begin //res_wr
	if(!reset)
		res_wr <= 0;
    else if(state_cs == ST_IDLE && !sti_di[15-cnt])
        res_wr <= 1;
    else if(state_cs == ST_BG)
        res_wr <= 0;
    else if(state_cs == ST_W)
        res_wr <= 1;
    else if(state_cs ==ST_OD)
        res_wr <= 0;
    else if(state_cs == ST_BW && !res_di)
        res_wr <= 1;
    else if(state_cs ==ST_BG2)
        res_wr <= 0;
    else if(state_cs ==ST_SE)
        res_wr <= 1;
    else if (state_cs ==ST_Pxy)
        res_wr <= 0;
end

always @(posedge clk or negedge reset) begin //res_addr
	if(!reset)
		res_addr <= 0;
    else if(state_cs == ST_BG)
        res_addr <= res_addr + 1;
    else if(state_cs == ST_IDLE && sti_di[15-cnt])
        res_addr <= res_addr - 129;
    else if(state_cs ==ST_NW)
        res_addr <= res_addr + 1;
    else if(state_cs == ST_N)
        res_addr <= res_addr + 1;
    else if(state_cs == ST_NE)
        res_addr <= res_addr +126;
    else if(state_cs ==ST_W)
        res_addr <= res_addr +1;
    else if(state_cs == ST_OD)
        res_addr <= res_addr +1;
    else if(state_cs == ST_FWD)
        res_addr <=14'd16383;
    else if(state_cs == ST_BG2)
        res_addr <= res_addr - 1;
    else if(state_cs == ST_BW && res_di)
        res_addr <= res_addr +1;
    else if(state_cs == ST_E)
        res_addr <= res_addr +126;
    else if(state_cs == ST_SW)
        res_addr <=res_addr+1;
    else if(state_cs == ST_S)
        res_addr <= res_addr+1;
    else if(state_cs == ST_SE)
        res_addr <= res_addr -129;
    else if (state_cs == ST_Pxy)
        res_addr <= res_addr -1;
end

always @(posedge clk or negedge reset) begin //res_do
    if(!reset)
        res_do <= 0;
	else if(state_cs == ST_IDLE && !sti_di[15-cnt])
        res_do <= 0;
    else if(state_cs == ST_NW)
        res_do <= res_di;
    else if(state_cs == ST_N && (res_do>res_di))
        res_do <= res_di;
    else if(state_cs == ST_NE && (res_do>res_di))
        res_do <= res_di;
    else if(state_cs == ST_W && (res_do>res_di))
        res_do <= res_di + 1;
    else if(state_cs == ST_W && (res_do <= res_di))
        res_do <= res_do + 1;
    else if(state_cs == ST_BW)
        res_do <= res_di;
    else if(state_cs == ST_E && (res_do >res_di +1))
        res_do <= res_di +1;
    else if(state_cs == ST_SW && (res_do >res_di+1))
        res_do <= res_di +1;
    else if(state_cs ==ST_S && (res_do>res_di+1))
        res_do <= res_di+1;
    else if(state_cs == ST_SE && (res_do>res_di+1))
        res_do <= res_di +1;
end

always @(posedge clk or negedge reset) begin //res_rd
	if(!reset)
		res_rd <= 0;
    else if(state_cs == ST_IDLE && sti_di[15-cnt])
        res_rd <= 1;
    else if(state_cs == ST_W)
        res_rd <= 0;
    else if(state_cs == ST_FWD)
        res_rd <= 1;
    else if(state_cs == ST_BW && !res_di)
        res_rd <= 0;
    else if(state_cs == ST_BG2)
        res_rd <= 1;
    else if(state_cs ==ST_SE)
        res_rd <= 0;
    else if(state_cs == ST_Pxy)
        res_rd <= 1;
end

always @(posedge clk or negedge reset) begin //done
	if(!reset)
		done <= 0;
	else if(state_cs == ST_ALLD)
		done <= 1;
end
//=========================================================
endmodule