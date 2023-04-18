module final (
	 input CLOCK_50,
    input [7:0] time_in,
    input set_hour, set_minute, set_second, set_mil, set_alarm, set_time,
    output reg [6:0] hex7, hex6, hex5, hex4, hex3, hex2, hex1, hex0,
	 out
	 put alarm_sound
);

    reg [31:0] time_out, alarm;
	 
	 initial begin
			time_out = 0;
			alarm = 0;
	 end
	 
	 always @(posedge CLOCK_50) begin
	 
	 end
	 
	 always @(posedge set_alarm or posedge set_time) begin
			if (set_time) begin
				 if (set_hour) begin
					  time_out[31:24] = time_in;
				 end

				 else if (set_minute) begin
					  time_out[23:16] = time_in;
				 end

				 else if (set_second) begin
					  time_out[15:8] = time_in;
				 end

				 else if (set_mil) begin
					  time_out[7:0] = time_in;
				 end
			end
			else if (set_alarm) begin
				 if (set_hour) begin
					  alarm[31:24] = time_in;
				 end

				 else if (set_minute) begin
					  alarm[23:16] = time_in;
				 end

				 else if (set_second) begin
					  alarm[15:8] = time_in;
				 end

				 else if (set_mil) begin
					  alarm[7:0] = time_in;
				 end
			end
	 end
	 
	 
	 always @* begin
		case (time_out[3:0])
			0  : hex0 = 7'b1000000;
			1  : hex0 = 7'b1111001;
			2  : hex0 = 7'b0100100;
			3  : hex0 = 7'b0110000;
			4  : hex0 = 7'b0011001;
			5  : hex0 = 7'b0010010;
			6  : hex0 = 7'b0000010;
			7  : hex0 = 7'b1111000;
			8  : hex0 = 7'b0000000;
			9  : hex0 = 7'b0011000;
			default : hex0 = 7'bx; 
		endcase
		case (time_out[7:4])
			0  : hex1 = 7'b1000000;
			1  : hex1 = 7'b1111001;
			2  : hex1 = 7'b0100100;
			3  : hex1 = 7'b0110000;
			4  : hex1 = 7'b0011001;
			5  : hex1 = 7'b0010010;
			6  : hex1 = 7'b0000010;
			7  : hex1 = 7'b1111000;
			8  : hex1 = 7'b0000000;
			9  : hex1 = 7'b0011000;
			default : hex1 = 7'bx; 
		endcase
		case (time_out[11:8])
			0  : hex2 = 7'b1000000;
			1  : hex2 = 7'b1111001;
			2  : hex2 = 7'b0100100;
			3  : hex2 = 7'b0110000;
			4  : hex2 = 7'b0011001;
			5  : hex2 = 7'b0010010;
			6  : hex2 = 7'b0000010;
			7  : hex2 = 7'b1111000;
			8  : hex2 = 7'b0000000;
			9  : hex2 = 7'b0011000;
			default : hex2 = 7'bx; 
		endcase
		case (time_out[15:12])
			0  : hex3 = 7'b1000000;
			1  : hex3 = 7'b1111001;
			2  : hex3 = 7'b0100100;
			3  : hex3 = 7'b0110000;
			4  : hex3 = 7'b0011001;
			5  : hex3 = 7'b0010010;
			6  : hex3 = 7'b0000010;
			7  : hex3 = 7'b1111000;
			8  : hex3 = 7'b0000000;
			9  : hex3 = 7'b0011000;
			default : hex3 = 7'bx; 
		endcase
		case (time_out[19:16])
			0  : hex4 = 7'b1000000;
			1  : hex4 = 7'b1111001;
			2  : hex4 = 7'b0100100;
			3  : hex4 = 7'b0110000;
			4  : hex4 = 7'b0011001;
			5  : hex4 = 7'b0010010;
			6  : hex4 = 7'b0000010;
			7  : hex4 = 7'b1111000;
			8  : hex4 = 7'b0000000;
			9  : hex4 = 7'b0011000;
			default : hex4 = 7'bx; 
		endcase
		case (time_out[23:20])
			0  : hex5 = 7'b1000000;
			1  : hex5 = 7'b1111001;
			2  : hex5 = 7'b0100100;
			3  : hex5 = 7'b0110000;
			4  : hex5 = 7'b0011001;
			5  : hex5 = 7'b0010010;
			6  : hex5 = 7'b0000010;
			7  : hex5 = 7'b1111000;
			8  : hex5 = 7'b0000000;
			9  : hex5 = 7'b0011000;
			default : hex5 = 7'bx; 
		endcase
		case (time_out[27:24])
			0  : hex6 = 7'b1000000;
			1  : hex6 = 7'b1111001;
			2  : hex6 = 7'b0100100;
			3  : hex6 = 7'b0110000;
			4  : hex6 = 7'b0011001;
			5  : hex6 = 7'b0010010;
			6  : hex6 = 7'b0000010;
			7  : hex6 = 7'b1111000;
			8  : hex6 = 7'b0000000;
			9  : hex6 = 7'b0011000;
			default : hex6 = 7'bx; 
		endcase
		case (time_out[31:28])
			0  : hex7 = 7'b1000000;
			1  : hex7 = 7'b1111001;
			2  : hex7 = 7'b0100100;
			3  : hex7 = 7'b0110000;
			4  : hex7 = 7'b0011001;
			5  : hex7 = 7'b0010010;
			6  : hex7 = 7'b0000010;
			7  : hex7 = 7'b1111000;
			8  : hex7 = 7'b0000000;
			9  : hex7 = 7'b0011000;
			default : hex7 = 7'bx; 
		endcase
    end
	 
endmodule
