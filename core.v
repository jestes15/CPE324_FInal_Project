module final (
	input CLOCK_50,
	input [7:0] time_in,
	input set_hour, set_minute, set_second, set_mil, set_alarm, set_time,
	output reg [6:0] hex7, hex6, hex5, hex4, hex3, hex2, hex1, hex0,
	output reg alarm_sound
);
	reg [31:0] time_out = 0;
	reg [31:0] alarm = 0;
	reg [31:0] intermediate = 0;
	reg [31:0] alarm_timer = 0;
	reg [31:0] alarm_counter = 0;
	reg [31:0] base_count = 50_000_000 / 100;
	reg [31:0] count = 50_000_000 / 100;
	reg alarm_start = 0;

	always @(posedge CLOCK_50 or posedge set_alarm or posedge set_time) begin
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
		else begin
		
			if (count) count = count - 1;
			
			else begin
				time_out[3:0] = time_out[3:0] + 1;
				
				// Milliseconds				
				if (time_out[3:0] > 9) begin
					time_out[3:0] = 0;
					time_out[7:4] = time_out[7:4] + 1;
				end
				if (time_out[7:4] > 9) begin 
					time_out[7:4] = 0;
					time_out[11:8] = time_out[11:8] + 1;
				end
				
				// Seconds
				if (time_out[11:8] > 9) begin 
					time_out[11:8] = 0;
					time_out[15:12] = time_out[15:12] + 1;
				end
				if (time_out[15:12] > 5) begin 
					time_out[15:12] = 0;
					time_out[19:16] = time_out[19:16] + 1;
				end
				
				
				// Minutes
				if (time_out[19:16] > 9) begin
						time_out[19:16] = 0;
						time_out[23:20] = time_out[23:20] + 1;
				end
				if (time_out[23:20] > 5) begin
						time_out[23:20] = 0;
						time_out[27:24] = time_out[27:24] + 1;
				end
				
				// Hours
				if (time_out[27:24] > 9) begin
						time_out[27:24] = 0;
						time_out[31:28] = time_out[31:28] + 1;
				end
				
				if (time_out[31:28] == 2 &&  time_out[27:24] == 4) begin
						time_out = 0;
				end
				
				if (time_out == alarm) alarm_start = 1;
				else alarm_start = 0;
				
				count = base_count;
			end
		end
	end

	always @(posedge CLOCK_50) begin
		if (set_alarm) intermediate = alarm;
		else intermediate = time_out;
	
		case (intermediate[3:0])
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
			case (intermediate[7:4])
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
		case (intermediate[11:8])
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
		case (intermediate[15:12])
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
		case (intermediate[19:16])
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
		case (intermediate[23:20])
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
		case (intermediate[27:24])
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
		case (intermediate[31:28])
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

	always @(posedge CLOCK_50) begin
		reg [31:0] note = 0;
		reg [15:0] frequency = 0;
		
		if (alarm_timer <= 1500) begin
			get_data(note, frequency, 0);
		end
		
		else if (alarm_timer <= 3000) begin
			get_data(note, frequency, 1);
		end
		
		else if (alarm_timer <= 4500) begin
			get_data(note, frequency, 2);
		end
		
		else if (alarm_timer <= 7000) begin
			get_data(note, frequency, 4);
		end
		
		
		if (alarm_start || alarm_timer) begin
			if (alarm_timer >= 7000 / 2)
				alarm_timer = 0;
					
			if (alarm_counter <= note) begin
				if (alarm_counter == note/2) begin
					alarm_sound = 0;
				end
				alarm_counter = alarm_counter + 1;
			end
			else  begin
				alarm_counter = 0;
				alarm_sound = 1;
				alarm_timer = alarm_timer + 1;
			end
		end
	end
	
	task get_data(
		output [31:0] note,
		output [15:0] freq,
		input index
	);
	
	if (index == 0) begin
		freq = 392;
		note = 50000000 / 392;
	end
	else if (index == 1) begin
		freq = 330;
		note = 50000000 / 330;
	end
	else if (index == 2) begin
		freq = 349;
		note = 50000000 / 349;
	end
	else if (index == 3) begin
		freq = 311;
		note = 50000000 / 311;
	end
	else if (index == 4) begin
		freq = 294;
		note = 50000000 / 294;
	end
				
	
	endtask

endmodule
