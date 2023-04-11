module time_set(
    input [7:0] time_in,
    input set_hour, set_minute, set_second, set_mil,
    output reg [31:0] time_out
);

    always @(posedge set_mil) begin
        time_out[31:24] = time_in;
    end

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