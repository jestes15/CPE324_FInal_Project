module seven_seg_driver(
    input [7:0] time_in,
    input set_hour, set_minute, set_second,
    output reg [23:0] time_out
);

    always @(posedge set_hour) begin
        time_out[23:16] = time_in;
    end

    always @(posedge set_minute) begin
        time_out[15:8] = time_in;
    end

    always @(posedge set_second) begin
        time_out[7:0] = time_in;
    end

endmodule