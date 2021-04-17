// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\Sementation_4K_480p\Segmentat_ip_src_MATLAB_Function.v
// Created: 2021-04-17 16:46:28
// 
// Generated by MATLAB 9.10 and HDL Coder 3.18
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Segmentat_ip_src_MATLAB_Function
// Source Path: Sementation_4K_480p/Segmentation_HW/K-Means/Clustering/MATLAB Function
// Hierarchy Level: 3
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Segmentat_ip_src_MATLAB_Function
          (vstart,
           fr_num,
           addr,
           rgb_0,
           rgb_1,
           rgb_2,
           rgb0_0,
           rgb0_1,
           rgb0_2,
           rgb1_0,
           rgb1_1,
           rgb1_2,
           rgb2_0,
           rgb2_1,
           rgb2_2,
           rgb3_0,
           rgb3_1,
           rgb3_2,
           RGB0_0_1,
           RGB0_1_1,
           RGB0_2_1,
           RGB1_0_1,
           RGB1_1_1,
           RGB1_2_1,
           RGB2_0_1,
           RGB2_1_1,
           RGB2_2_1,
           RGB3_0_1,
           RGB3_1_1,
           RGB3_2_1);


  input   vstart;
  input   [11:0] fr_num;  // ufix12
  input   [1:0] addr;  // ufix2
  input   signed [17:0] rgb_0;  // sfix18_En8
  input   signed [17:0] rgb_1;  // sfix18_En8
  input   signed [17:0] rgb_2;  // sfix18_En8
  input   signed [17:0] rgb0_0;  // sfix18_En8
  input   signed [17:0] rgb0_1;  // sfix18_En8
  input   signed [17:0] rgb0_2;  // sfix18_En8
  input   signed [17:0] rgb1_0;  // sfix18_En8
  input   signed [17:0] rgb1_1;  // sfix18_En8
  input   signed [17:0] rgb1_2;  // sfix18_En8
  input   signed [17:0] rgb2_0;  // sfix18_En8
  input   signed [17:0] rgb2_1;  // sfix18_En8
  input   signed [17:0] rgb2_2;  // sfix18_En8
  input   signed [17:0] rgb3_0;  // sfix18_En8
  input   signed [17:0] rgb3_1;  // sfix18_En8
  input   signed [17:0] rgb3_2;  // sfix18_En8
  output  signed [17:0] RGB0_0_1;  // sfix18_En8
  output  signed [17:0] RGB0_1_1;  // sfix18_En8
  output  signed [17:0] RGB0_2_1;  // sfix18_En8
  output  signed [17:0] RGB1_0_1;  // sfix18_En8
  output  signed [17:0] RGB1_1_1;  // sfix18_En8
  output  signed [17:0] RGB1_2_1;  // sfix18_En8
  output  signed [17:0] RGB2_0_1;  // sfix18_En8
  output  signed [17:0] RGB2_1_1;  // sfix18_En8
  output  signed [17:0] RGB2_2_1;  // sfix18_En8
  output  signed [17:0] RGB3_0_1;  // sfix18_En8
  output  signed [17:0] RGB3_1_1;  // sfix18_En8
  output  signed [17:0] RGB3_2_1;  // sfix18_En8


  wire signed [17:0] rgb [0:2];  // sfix18_En8 [3]
  wire signed [17:0] rgb0 [0:2];  // sfix18_En8 [3]
  wire signed [17:0] rgb1 [0:2];  // sfix18_En8 [3]
  wire signed [17:0] rgb2 [0:2];  // sfix18_En8 [3]
  wire signed [17:0] rgb3 [0:2];  // sfix18_En8 [3]
  reg signed [17:0] RGB0_3 [0:2];  // sfix18_En8 [3]
  reg signed [17:0] RGB1_3 [0:2];  // sfix18_En8 [3]
  reg signed [17:0] RGB2_3 [0:2];  // sfix18_En8 [3]
  reg signed [17:0] RGB3_3 [0:2];  // sfix18_En8 [3]
  reg signed [35:0] rgb_alpha [0:2];  // sfix36_En23 [3]
  reg signed [31:0] t_0;  // int32
  reg signed [31:0] t_1;  // int32
  reg signed [31:0] t_2;  // int32
  reg signed [31:0] t_3;  // int32
  reg signed [31:0] t_4;  // int32
  reg signed [31:0] t_5;  // int32
  reg signed [33:0] mul_temp [0:2];  // sfix34_En23 [3]
  reg signed [36:0] add_cast [0:2];  // sfix37_En23 [3]
  reg signed [36:0] add_cast_0 [0:2];  // sfix37_En23 [3]
  reg signed [36:0] add_temp [0:2];  // sfix37_En23 [3]
  reg signed [33:0] mul_temp_0 [0:2];  // sfix34_En23 [3]
  reg signed [36:0] add_cast_1 [0:2];  // sfix37_En23 [3]
  reg signed [36:0] add_cast_2 [0:2];  // sfix37_En23 [3]
  reg signed [36:0] add_temp_0 [0:2];  // sfix37_En23 [3]
  reg signed [33:0] mul_temp_1 [0:2];  // sfix34_En23 [3]
  reg signed [36:0] add_cast_3 [0:2];  // sfix37_En23 [3]
  reg signed [36:0] add_cast_4 [0:2];  // sfix37_En23 [3]
  reg signed [36:0] add_temp_1 [0:2];  // sfix37_En23 [3]
  reg signed [33:0] mul_temp_2 [0:2];  // sfix34_En23 [3]
  reg signed [36:0] add_cast_5 [0:2];  // sfix37_En23 [3]
  reg signed [36:0] add_cast_6 [0:2];  // sfix37_En23 [3]
  reg signed [36:0] add_temp_2 [0:2];  // sfix37_En23 [3]


  assign rgb[0] = rgb_0;
  assign rgb[1] = rgb_1;
  assign rgb[2] = rgb_2;

  assign rgb0[0] = rgb0_0;
  assign rgb0[1] = rgb0_1;
  assign rgb0[2] = rgb0_2;

  assign rgb1[0] = rgb1_0;
  assign rgb1[1] = rgb1_1;
  assign rgb1[2] = rgb1_2;

  assign rgb2[0] = rgb2_0;
  assign rgb2[1] = rgb2_1;
  assign rgb2[2] = rgb2_2;

  assign rgb3[0] = rgb3_0;
  assign rgb3[1] = rgb3_1;
  assign rgb3[2] = rgb3_2;

  always @* begin

    for(t_0 = 32'sd0; t_0 <= 32'sd2; t_0 = t_0 + 32'sd1) begin
      rgb_alpha[t_0] = rgb[t_0] * 18'sb000000000000100001;
    end

    if (vstart && (fr_num == 12'b000000000000)) begin

      for(t_1 = 32'sd0; t_1 <= 32'sd2; t_1 = t_1 + 32'sd1) begin
        RGB0_3[t_1] = 18'sb000111111100000000;
        RGB1_3[t_1] = 18'sb000111111100000000;
        RGB2_3[t_1] = 18'sb000111111100000000;
        RGB3_3[t_1] = 18'sb000111111100000000;
      end

    end
    else if (addr == 2'b00) begin

      for(t_2 = 32'sd0; t_2 <= 32'sd2; t_2 = t_2 + 32'sd1) begin
        mul_temp[t_2] = rgb0[t_2] * 16'sb0111111111011111;
        add_cast[t_2] = {{3{mul_temp[t_2][33]}}, mul_temp[t_2]};
        add_cast_0[t_2] = {rgb_alpha[t_2][35], rgb_alpha[t_2]};
        add_temp[t_2] = add_cast[t_2] + add_cast_0[t_2];
        if (((add_temp[t_2][36] == 1'b0) && (add_temp[t_2][35:32] != 4'b0000)) || ((add_temp[t_2][36] == 1'b0) && (add_temp[t_2][32:15] == 18'sb011111111111111111))) begin
          RGB0_3[t_2] = 18'sb011111111111111111;
        end
        else if ((add_temp[t_2][36] == 1'b1) && (add_temp[t_2][35:32] != 4'b1111)) begin
          RGB0_3[t_2] = 18'sb100000000000000000;
        end
        else begin
          RGB0_3[t_2] = add_temp[t_2][32:15] + $signed({1'b0, add_temp[t_2][14]});
        end
        RGB1_3[t_2] = rgb1[t_2];
        RGB2_3[t_2] = rgb2[t_2];
        RGB3_3[t_2] = rgb3[t_2];
      end

    end
    else if (addr == 2'b01) begin

      for(t_3 = 32'sd0; t_3 <= 32'sd2; t_3 = t_3 + 32'sd1) begin
        RGB0_3[t_3] = rgb0[t_3];
        mul_temp_0[t_3] = rgb1[t_3] * 16'sb0111111111011111;
        add_cast_1[t_3] = {{3{mul_temp_0[t_3][33]}}, mul_temp_0[t_3]};
        add_cast_2[t_3] = {rgb_alpha[t_3][35], rgb_alpha[t_3]};
        add_temp_0[t_3] = add_cast_1[t_3] + add_cast_2[t_3];
        if (((add_temp_0[t_3][36] == 1'b0) && (add_temp_0[t_3][35:32] != 4'b0000)) || ((add_temp_0[t_3][36] == 1'b0) && (add_temp_0[t_3][32:15] == 18'sb011111111111111111))) begin
          RGB1_3[t_3] = 18'sb011111111111111111;
        end
        else if ((add_temp_0[t_3][36] == 1'b1) && (add_temp_0[t_3][35:32] != 4'b1111)) begin
          RGB1_3[t_3] = 18'sb100000000000000000;
        end
        else begin
          RGB1_3[t_3] = add_temp_0[t_3][32:15] + $signed({1'b0, add_temp_0[t_3][14]});
        end
        RGB2_3[t_3] = rgb2[t_3];
        RGB3_3[t_3] = rgb3[t_3];
      end

    end
    else if (addr == 2'b10) begin

      for(t_5 = 32'sd0; t_5 <= 32'sd2; t_5 = t_5 + 32'sd1) begin
        RGB0_3[t_5] = rgb0[t_5];
        RGB1_3[t_5] = rgb1[t_5];
        mul_temp_1[t_5] = rgb2[t_5] * 16'sb0111111111011111;
        add_cast_3[t_5] = {{3{mul_temp_1[t_5][33]}}, mul_temp_1[t_5]};
        add_cast_4[t_5] = {rgb_alpha[t_5][35], rgb_alpha[t_5]};
        add_temp_1[t_5] = add_cast_3[t_5] + add_cast_4[t_5];
        if (((add_temp_1[t_5][36] == 1'b0) && (add_temp_1[t_5][35:32] != 4'b0000)) || ((add_temp_1[t_5][36] == 1'b0) && (add_temp_1[t_5][32:15] == 18'sb011111111111111111))) begin
          RGB2_3[t_5] = 18'sb011111111111111111;
        end
        else if ((add_temp_1[t_5][36] == 1'b1) && (add_temp_1[t_5][35:32] != 4'b1111)) begin
          RGB2_3[t_5] = 18'sb100000000000000000;
        end
        else begin
          RGB2_3[t_5] = add_temp_1[t_5][32:15] + $signed({1'b0, add_temp_1[t_5][14]});
        end
        RGB3_3[t_5] = rgb3[t_5];
      end

    end
    else begin

      for(t_4 = 32'sd0; t_4 <= 32'sd2; t_4 = t_4 + 32'sd1) begin
        RGB0_3[t_4] = rgb0[t_4];
        RGB1_3[t_4] = rgb1[t_4];
        RGB2_3[t_4] = rgb2[t_4];
        mul_temp_2[t_4] = rgb3[t_4] * 16'sb0111111111011111;
        add_cast_5[t_4] = {{3{mul_temp_2[t_4][33]}}, mul_temp_2[t_4]};
        add_cast_6[t_4] = {rgb_alpha[t_4][35], rgb_alpha[t_4]};
        add_temp_2[t_4] = add_cast_5[t_4] + add_cast_6[t_4];
        if (((add_temp_2[t_4][36] == 1'b0) && (add_temp_2[t_4][35:32] != 4'b0000)) || ((add_temp_2[t_4][36] == 1'b0) && (add_temp_2[t_4][32:15] == 18'sb011111111111111111))) begin
          RGB3_3[t_4] = 18'sb011111111111111111;
        end
        else if ((add_temp_2[t_4][36] == 1'b1) && (add_temp_2[t_4][35:32] != 4'b1111)) begin
          RGB3_3[t_4] = 18'sb100000000000000000;
        end
        else begin
          RGB3_3[t_4] = add_temp_2[t_4][32:15] + $signed({1'b0, add_temp_2[t_4][14]});
        end
      end

    end
  end



  assign RGB0_0_1 = RGB0_3[0];

  assign RGB0_1_1 = RGB0_3[1];

  assign RGB0_2_1 = RGB0_3[2];

  assign RGB1_0_1 = RGB1_3[0];

  assign RGB1_1_1 = RGB1_3[1];

  assign RGB1_2_1 = RGB1_3[2];

  assign RGB2_0_1 = RGB2_3[0];

  assign RGB2_1_1 = RGB2_3[1];

  assign RGB2_2_1 = RGB2_3[2];

  assign RGB3_0_1 = RGB3_3[0];

  assign RGB3_1_1 = RGB3_3[1];

  assign RGB3_2_1 = RGB3_3[2];

endmodule  // Segmentat_ip_src_MATLAB_Function
