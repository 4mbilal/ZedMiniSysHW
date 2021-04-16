// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\BilateralFilterIP\Bilateral_ip_src_PushPopCounter.v
// Created: 2021-04-16 01:15:52
// 
// Generated by MATLAB 9.10 and HDL Coder 3.18
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Bilateral_ip_src_PushPopCounter
// Source Path: BilateralFilterIP/BilateralFilter_HW/Bilateral Filter1/LineBuffer/DATA_MEMORY/PushPopCounter
// Hierarchy Level: 4
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Bilateral_ip_src_PushPopCounter
          (clk,
           reset,
           enb,
           hStartIn,
           popIn,
           popEnable,
           hEndIn,
           writeCountPrev,
           wrAddr,
           pushOut,
           rdAddr,
           EndofLine);


  input   clk;
  input   reset;
  input   enb;
  input   hStartIn;
  input   popIn;
  input   popEnable;
  input   hEndIn;
  input   [9:0] writeCountPrev;  // ufix10
  output  [9:0] wrAddr;  // ufix10
  output  pushOut;
  output  [9:0] rdAddr;  // ufix10
  output  EndofLine;


  reg [9:0] writePrevREG;  // ufix10
  wire InBetweenEn;
  wire ConstantZero;
  wire InBetweenRegIn;
  reg  InBetween;
  reg [9:0] writeCount;  // ufix10
  wire relop_relop1;
  wire writeContinue;
  wire writeEN;
  reg  [0:1] intdelay_reg;  // ufix1 [2]
  wire [0:1] intdelay_reg_next;  // ufix1 [2]
  wire writeStoreEn;
  reg [9:0] writeCountNext;  // ufix10
  reg [9:0] writeCountCurrent;  // ufix10
  wire [9:0] readCountCompare;  // ufix10
  wire readCountCompare_is_not0;
  wire popTerm2;
  wire relop_relop1_1;
  wire and_bool;
  wire readCountCompare_is_not0_1;
  wire popTerm1;
  wire popCounter;
  wire readReset;
  reg  readPop;
  reg [9:0] readCount;  // ufix10
  wire popcountless;
  wire relop_relop1_2;
  wire startOrEnd;
  wire [9:0] constantTwo;  // ufix10
  wire [9:0] readCountAhead;  // ufix10
  wire relop_relop1_3;


  always @(posedge clk or posedge reset)
    begin : reg_rsvd_process
      if (reset == 1'b1) begin
        writePrevREG <= 10'b0000000000;
      end
      else begin
        if (enb && hStartIn) begin
          writePrevREG <= writeCountPrev;
        end
      end
    end



  assign InBetweenEn = hStartIn | hEndIn;



  assign ConstantZero = 1'b0;



  assign InBetweenRegIn = (hStartIn == 1'b0 ? hEndIn :
              ConstantZero);



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_1_process
      if (reset == 1'b1) begin
        InBetween <= 1'b0;
      end
      else begin
        if (enb && InBetweenEn) begin
          InBetween <= InBetweenRegIn;
        end
      end
    end



  assign relop_relop1 = writeCount <= writePrevREG;



  assign writeContinue = relop_relop1 & InBetween;



  assign writeEN = writeContinue | popIn;



  // Free running, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  always @(posedge clk or posedge reset)
    begin : Write_Count_process
      if (reset == 1'b1) begin
        writeCount <= 10'b0000000000;
      end
      else begin
        if (enb) begin
          if (hStartIn == 1'b1) begin
            writeCount <= 10'b0000000000;
          end
          else if (writeEN == 1'b1) begin
            writeCount <= writeCount + 10'b0000000001;
          end
        end
      end
    end



  assign wrAddr = writeCount;

  assign pushOut = writeEN;

  always @(posedge clk or posedge reset)
    begin : intdelay_process
      if (reset == 1'b1) begin
        intdelay_reg[0] <= 1'b0;
        intdelay_reg[1] <= 1'b0;
      end
      else begin
        if (enb) begin
          intdelay_reg[0] <= intdelay_reg_next[0];
          intdelay_reg[1] <= intdelay_reg_next[1];
        end
      end
    end

  assign writeStoreEn = intdelay_reg[1];
  assign intdelay_reg_next[0] = hEndIn;
  assign intdelay_reg_next[1] = intdelay_reg[0];



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_2_process
      if (reset == 1'b1) begin
        writeCountNext <= 10'b0000000000;
      end
      else begin
        if (enb && writeStoreEn) begin
          writeCountNext <= writeCount;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_3_process
      if (reset == 1'b1) begin
        writeCountCurrent <= 10'b0000000000;
      end
      else begin
        if (enb && hStartIn) begin
          writeCountCurrent <= writeCountNext;
        end
      end
    end



  assign readCountCompare_is_not0 = readCountCompare != 10'b0000000000;



  assign popTerm2 = readCountCompare_is_not0 & InBetween;



  assign and_bool = popEnable & relop_relop1_1;



  assign readCountCompare = {9'b0, and_bool};



  assign readCountCompare_is_not0_1 = readCountCompare != 10'b0000000000;



  assign popTerm1 = popIn & readCountCompare_is_not0_1;



  assign popCounter = popTerm1 | popTerm2;



  always @(posedge clk or posedge reset)
    begin : readResetREG_process
      if (reset == 1'b1) begin
        readPop <= 1'b0;
      end
      else begin
        if (enb) begin
          if (readReset == 1'b1) begin
            readPop <= 1'b0;
          end
          else begin
            if (hStartIn) begin
              readPop <= hStartIn;
            end
          end
        end
      end
    end



  assign relop_relop1_1 = readCount < writeCountCurrent;



  assign popcountless = popCounter & (relop_relop1_1 & readPop);



  assign relop_relop1_2 = readCount == writeCountCurrent;



  assign readReset = writeEN & relop_relop1_2;



  assign startOrEnd = hStartIn | readReset;



  // Free running, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  always @(posedge clk or posedge reset)
    begin : Read_Count_process
      if (reset == 1'b1) begin
        readCount <= 10'b0000000000;
      end
      else begin
        if (enb) begin
          if (startOrEnd == 1'b1) begin
            readCount <= 10'b0000000000;
          end
          else if (popcountless == 1'b1) begin
            readCount <= readCount + 10'b0000000001;
          end
        end
      end
    end



  assign rdAddr = readCount;

  assign constantTwo = 10'b0000000101;



  assign readCountAhead = readCount + constantTwo;



  assign relop_relop1_3 = readCountAhead == writeCountCurrent;



  assign EndofLine = relop_relop1_3;

endmodule  // Bilateral_ip_src_PushPopCounter
