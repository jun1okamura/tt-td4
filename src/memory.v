`default_nettype none

module Memory (
    input  wire        clk,
    input  wire        rst_n,         // 非同期アクティブLowリセット
    input  wire        write,         // 1で書き込み
    input  wire [3:0]  address,       // 0..15
    input  wire [3:0]  opcode_in,
    input  wire [3:0]  immediate_in,
    output wire [3:0]  opcode_out,
    output wire [3:0]  immediate_out
);
  parameter MAX_MEM = 8;

  // 8-bit × 16-word メモリ
  reg [7:0] data [0:MAX_MEM - 1];

  integer i;

  // 書き込み＆リセット（読み出しは非同期）
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      // 0クリア
      for (i = 0; i < MAX_MEM; i = i + 1) begin
        data[i] <= 8'h00;
      end
    end else begin
      if (write) begin
        // 上位: immediate, 下位: opcode
        data[address] <= {immediate_in, opcode_in};
      end
    end
  end

  // 非同期読み出し
  assign {immediate_out, opcode_out} = data[address];

endmodule

