// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\HSG\HSG_IP_src_lineSpaceStore_block.v
// Created: 2018-10-21 17:42:58
// 
// Generated by MATLAB 9.3 and HDL Coder 3.11
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: HSG_IP_src_lineSpaceStore_block
// Source Path: HSG/HSG/Image Filter/LineBuffer/lineSpaceStore
// Hierarchy Level: 3
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module HSG_IP_src_lineSpaceStore_block
          (clk,
           reset,
           enb,
           lineSpaceAverageIn,
           lineSpaceLoad,
           lineSpaceEn,
           Initialize,
           lineSpace);


  input   clk;
  input   reset;
  input   enb;
  input   [11:0] lineSpaceAverageIn;  // ufix12
  input   lineSpaceLoad;
  input   lineSpaceEn;
  input   Initialize;
  output  [11:0] lineSpace;  // ufix12

  reg  lineSpaceLoad_1;
  reg  lineSpaceLoad_2;
  wire [1:0] loadEnConcat;  // ufix2
  wire signed [12:0] lineSpaceConst;  // sfix13
  reg  lineSpaceLoad_3;
  wire lineSpaceLoadEnb;
  reg  reg_switch_delay;  // ufix1
  wire lineSpaceSEL;
  reg [11:0] lineSpaceAverageREG;  // ufix12
  wire signed [12:0] adder_1;  // sfix13
  wire signed [12:0] lineSpaceSub;  // sfix13
  wire [11:0] lineSpaceSub_dtc;  // ufix12
  wire [11:0] lineSpaceNew;  // ufix12
  reg [11:0] lineSpaceREG;  // ufix12
  wire signed [12:0] adder_3;  // sfix13
  wire signed [12:0] lineSpaceSub_1;  // sfix13
  wire [11:0] lineSpaceSubCast;  // ufix12
  wire [11:0] lineSpaceMOut;  // ufix12


  always @(posedge clk or posedge reset)
    begin : intdelay_process
      if (reset == 1'b1) begin
        lineSpaceLoad_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          lineSpaceLoad_1 <= lineSpaceLoad;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_1_process
      if (reset == 1'b1) begin
        lineSpaceLoad_2 <= 1'b0;
      end
      else begin
        if (enb) begin
          lineSpaceLoad_2 <= lineSpaceEn;
        end
      end
    end



  assign loadEnConcat = {lineSpaceLoad_1, lineSpaceLoad_2};



  assign lineSpaceConst = 13'sb1111111111111;



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_process
      if (reset == 1'b1) begin
        lineSpaceLoad_3 <= 1'b0;
      end
      else begin
        if (enb) begin
          lineSpaceLoad_3 <= Initialize;
        end
      end
    end



  assign lineSpaceLoadEnb = lineSpaceLoad_3 & enb;



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_1_process
      if (reset == 1'b1) begin
        reg_switch_delay <= 1'b0;
      end
      else begin
        if (enb) begin
          if (lineSpaceLoadEnb == 1'b1) begin
            reg_switch_delay <= 1'b0;
          end
          else begin
            if (lineSpaceLoad_1) begin
              reg_switch_delay <= lineSpaceLoad_1;
            end
          end
        end
      end
    end

  assign lineSpaceSEL = (lineSpaceLoadEnb == 1'b1 ? 1'b0 :
              reg_switch_delay);



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_2_process
      if (reset == 1'b1) begin
        lineSpaceAverageREG <= 12'b000000000000;
      end
      else begin
        if (enb) begin
          lineSpaceAverageREG <= lineSpaceAverageIn;
        end
      end
    end



  assign adder_1 = {1'b0, lineSpaceAverageREG};
  assign lineSpaceSub = adder_1 + lineSpaceConst;



  assign lineSpaceSub_dtc = lineSpaceSub[11:0];



  assign lineSpaceNew = (lineSpaceSEL == 1'b0 ? lineSpaceAverageREG :
              lineSpaceSub_dtc);



  assign adder_3 = {1'b0, lineSpaceREG};
  assign lineSpaceSub_1 = adder_3 + lineSpaceConst;



  assign lineSpaceSubCast = lineSpaceSub_1[11:0];



  assign lineSpaceMOut = (loadEnConcat == 2'b00 ? lineSpaceREG :
              (loadEnConcat == 2'b01 ? lineSpaceSubCast :
              (loadEnConcat == 2'b10 ? lineSpaceNew :
              lineSpaceNew)));



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_3_process
      if (reset == 1'b1) begin
        lineSpaceREG <= 12'b000000000000;
      end
      else begin
        if (enb) begin
          lineSpaceREG <= lineSpaceMOut;
        end
      end
    end



  assign lineSpace = lineSpaceREG;

endmodule  // HSG_IP_src_lineSpaceStore_block
