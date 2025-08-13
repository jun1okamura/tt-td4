`default_nettype none


module Memory (
    input wire [3:0] address,
    input wire [3:0] opcode_in,
    input wire [3:0] immediate_in,
    output reg [3:0] opcode_out,
    output reg [3:0] immediate_out,
    input wire write,
    input wire clk,
    input wire rst_n
  );

  reg [7:0] data[0:15]; // 8bit 16wordメモリ

  integer i;
  always @(posedge clk or negedge rst_n)
  begin
    if (!rst_n)
    begin
      // リセット(0クリア)
      for (i = 0; i < 16; i = i + 1)
      begin
        data[i] <= 8'b0;
      end
    end
    else if (write)
    begin
      // 書き込み
      case (address)
        4'd0:
          data[0]  <= {immediate_in, opcode_in};
        4'd1:
          data[1]  <= {immediate_in, opcode_in};
        4'd2:
          data[2]  <= {immediate_in, opcode_in};
        4'd3:
          data[3]  <= {immediate_in, opcode_in};
        4'd4:
          data[4]  <= {immediate_in, opcode_in};
        4'd5:
          data[5]  <= {immediate_in, opcode_in};
        4'd6:
          data[6]  <= {immediate_in, opcode_in};
        4'd7:
          data[7]  <= {immediate_in, opcode_in};
        4'd8:
          data[8]  <= {immediate_in, opcode_in};
        4'd9:
          data[9]  <= {immediate_in, opcode_in};
        4'd10:
          data[10] <= {immediate_in, opcode_in};
        4'd11:
          data[11] <= {immediate_in, opcode_in};
        4'd12:
          data[12] <= {immediate_in, opcode_in};
        4'd13:
          data[13] <= {immediate_in, opcode_in};
        4'd14:
          data[14] <= {immediate_in, opcode_in};
        4'd15:
          data[15] <= {immediate_in, opcode_in};
        default:
          ;
      endcase
    end
  end

  always @(*)
  begin
    case (address)
      4'd0:
        {immediate_out, opcode_out} = data[0];
      4'd1:
        {immediate_out, opcode_out} = data[1];
      4'd2:
        {immediate_out, opcode_out} = data[2];
      4'd3:
        {immediate_out, opcode_out} = data[3];
      4'd4:
        {immediate_out, opcode_out} = data[4];
      4'd5:
        {immediate_out, opcode_out} = data[5];
      4'd6:
        {immediate_out, opcode_out} = data[6];
      4'd7:
        {immediate_out, opcode_out} = data[7];
      4'd8:
        {immediate_out, opcode_out} = data[8];
      4'd9:
        {immediate_out, opcode_out} = data[9];
      4'd10:
        {immediate_out, opcode_out} = data[10];
      4'd11:
        {immediate_out, opcode_out} = data[11];
      4'd12:
        {immediate_out, opcode_out} = data[12];
      4'd13:
        {immediate_out, opcode_out} = data[13];
      4'd14:
        {immediate_out, opcode_out} = data[14];
      4'd15:
        {immediate_out, opcode_out} = data[15];
      default:
        {immediate_out, opcode_out} = 8'b0;
    endcase
  end

endmodule

