module core (
    input [7:0] time_in,
    input set_hour, set_minute, set_second, set_mil,
    output [6:0] hex7, hex6, hex5, hex4, hex3, hex2, hex1, hex0
);

    wire [31:0] time_wire;
    wire [6:0] hex7_wire, hex6_wire, hex5_wire, hex4_wire, hex3_wire, hex2_wire, hex1_wire, hex0_wire;

    time_set .TI (.time_in(tine_in), .set_hour(set_hour), .set_minute(set_minute), .set_second(set_second), .set_mil(set_mil), .time_out(time_wire));
    seven_seg_driver .SSD (.time_in_bcd(time_wire), .hex0(hex0), .hex1(hex1_wire), .hex2(hex2_wire), .hex3(hex3_wire), .hex4(hex4_wire), .hex5(hex5_wire), .hex6(hex6_wire), .hex7(hex7_wire));

endmodule