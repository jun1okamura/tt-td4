`default_nettype none


module Memory (
    input wire [3:0] address,
    input wire [3:0] opcode_in,
    input wire [3:0] immediate_in,
    output wire [3:0] opcode_out,
    output wire [3:0] immediate_out,
    input wire write,
    input wire clk,
    input wire rst_n
  );

  reg [7:0] data[0:15]; // 8bit 16wordメモリ

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      // リセット(0クリア)
      data <= 128'b0;
    end
    else begin
        if (write) begin
          // 書き込み
        data[address] <= {immediate_in, opcode_in};
        end
    end
  end

  assign {immediate_out, opcode_out} = data[address];

endmodule

