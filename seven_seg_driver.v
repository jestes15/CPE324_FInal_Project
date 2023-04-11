module seven_seg_driver(
    input [31:0] time_in_bcd,
    output [6:0] hex7, hex6, hex5, hex4, hex3, hex2, hex1, hex0
);
    always @* begin
        case (time_in_bcd[3:0])
            0 : hex0 = 7'b0000001;
            1 : hex0 = 7'b1001111;
            2 : hex0 = 7'b0010010;
            3 : hex0 = 7'b0000110;
            4 : hex0 = 7'b1001100;
            5 : hex0 = 7'b0100100;
            6 : hex0 = 7'b0100000;
            7 : hex0 = 7'b0001111;
            8 : hex0 = 7'b0000000;
            9 : hex0 = 7'b0000100;
            default : hex0 = 7'b1111111; 
        endcase

        case (time_in_bcd[7:4])
            0 : hex1 = 7'b0000001;
            1 : hex1 = 7'b1001111;
            2 : hex1 = 7'b0010010;
            3 : hex1 = 7'b0000110;
            4 : hex1 = 7'b1001100;
            5 : hex1 = 7'b0100100;
            6 : hex1 = 7'b0100000;
            7 : hex1 = 7'b0001111;
            8 : hex1 = 7'b0000000;
            9 : hex1 = 7'b0000100;
            default : hex1 = 7'b1111111; 
        endcase

        case (time_in_bcd[11:8])
            0 : hex2 = 7'b0000001;
            1 : hex2 = 7'b1001111;
            2 : hex2 = 7'b0010010;
            3 : hex2 = 7'b0000110;
            4 : hex2 = 7'b1001100;
            5 : hex2 = 7'b0100100;
            6 : hex2 = 7'b0100000;
            7 : hex2 = 7'b0001111;
            8 : hex2 = 7'b0000000;
            9 : hex2 = 7'b0000100;
            default : hex2 = 7'b1111111; 
        endcase

        case (time_in_bcd[15:12])
            0 : hex3 = 7'b0000001;
            1 : hex3 = 7'b1001111;
            2 : hex3 = 7'b0010010;
            3 : hex3 = 7'b0000110;
            4 : hex3 = 7'b1001100;
            5 : hex3 = 7'b0100100;
            6 : hex3 = 7'b0100000;
            7 : hex3 = 7'b0001111;
            8 : hex3 = 7'b0000000;
            9 : hex3 = 7'b0000100;
            default : hex3 = 7'b1111111; 
        endcase

        case (time_in_bcd[19:16])
            0 : hex4 = 7'b0000001;
            1 : hex4 = 7'b1001111;
            2 : hex4 = 7'b0010010;
            3 : hex4 = 7'b0000110;
            4 : hex4 = 7'b1001100;
            5 : hex4 = 7'b0100100;
            6 : hex4 = 7'b0100000;
            7 : hex4 = 7'b0001111;
            8 : hex4 = 7'b0000000;
            9 : hex4 = 7'b0000100;
            default : hex4 = 7'b1111111; 
        endcase

        case (time_in_bcd[23:20])
            0 : hex5 = 7'b0000001;
            1 : hex5 = 7'b1001111;
            2 : hex5 = 7'b0010010;
            3 : hex5 = 7'b0000110;
            4 : hex5 = 7'b1001100;
            5 : hex5 = 7'b0100100;
            6 : hex5 = 7'b0100000;
            7 : hex5 = 7'b0001111;
            8 : hex5 = 7'b0000000;
            9 : hex5 = 7'b0000100;
            default : hex5 = 7'b1111111; 
        endcase

        case (time_in_bcd[27:24])
            0 : hex6 = 7'b0000001;
            1 : hex6 = 7'b1001111;
            2 : hex6 = 7'b0010010;
            3 : hex6 = 7'b0000110;
            4 : hex6 = 7'b1001100;
            5 : hex6 = 7'b0100100;
            6 : hex6 = 7'b0100000;
            7 : hex6 = 7'b0001111;
            8 : hex6 = 7'b0000000;
            9 : hex6 = 7'b0000100;
            default : hex6 = 7'b1111111; 
        endcase

        case (time_in_bcd[31:28])
            0 : hex7 = 7'b0000001;
            1 : hex7 = 7'b1001111;
            2 : hex7 = 7'b0010010;
            3 : hex7 = 7'b0000110;
            4 : hex7 = 7'b1001100;
            5 : hex7 = 7'b0100100;
            6 : hex7 = 7'b0100000;
            7 : hex7 = 7'b0001111;
            8 : hex7 = 7'b0000000;
            9 : hex7 = 7'b0000100;
            default : hex7 = 7'b1111111; 
        endcase
    end

endmodule