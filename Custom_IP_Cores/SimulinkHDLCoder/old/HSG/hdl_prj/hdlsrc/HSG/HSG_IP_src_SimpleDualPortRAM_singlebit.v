// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\HSG\HSG_IP_src_SimpleDualPortRAM_singlebit.v
// Created: 2018-10-21 17:42:58
// 
// Generated by MATLAB 9.3 and HDL Coder 3.11
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: HSG_IP_src_SimpleDualPortRAM_singlebit
// Source Path: HSG/HSG/Edge Detector/LineBuffer/DataMemory/FIFOLF/SimpleDualPortRAM_singlebit
// Hierarchy Level: 5
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module HSG_IP_src_SimpleDualPortRAM_singlebit
          (clk,
           enb,
           wr_din,
           wr_addr,
           wr_en,
           rd_addr,
           rd_dout);

  parameter AddrWidth = 1;
  parameter DataWidth = 1;

  input   clk;
  input   enb;
  input   wr_din;
  input   [AddrWidth - 1:0] wr_addr;  // parameterized width
  input   wr_en;  // ufix1
  input   [AddrWidth - 1:0] rd_addr;  // parameterized width
  output  rd_dout;

  reg   ram [2**AddrWidth - 1:0];
  reg   data_int;
  integer i;

  initial begin
    for (i=0; i<=2**AddrWidth - 1; i=i+1) begin
      ram[i] = 0;
    end
    data_int = 0;
  end


  always @(posedge clk)
    begin : SimpleDualPortRAM_singlebit_process
      if (enb == 1'b1) begin
        if (wr_en == 1'b1) begin
          ram[wr_addr] <= wr_din;
        end
        data_int <= ram[rd_addr];
      end
    end

  assign rd_dout = data_int;

endmodule  // HSG_IP_src_SimpleDualPortRAM_singlebit
