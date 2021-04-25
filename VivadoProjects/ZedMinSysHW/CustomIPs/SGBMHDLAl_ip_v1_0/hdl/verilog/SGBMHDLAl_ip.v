// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\SGBMDisparity\SGBMHDLAl_ip.v
// Created: 2021-04-19 19:46:47
// 
// Generated by MATLAB 9.10 and HDL Coder 3.18
// 
// 
// -- -------------------------------------------------------------
// -- Rate and Clocking Details
// -- -------------------------------------------------------------
// Model base rate: -1
// Target subsystem base rate: -1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: SGBMHDLAl_ip
// Source Path: SGBMHDLAl_ip
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module SGBMHDLAl_ip
          (IPCORE_CLK,
           IPCORE_RESETN,
           AXI4_Stream_Video_Master_TREADY,
           AXI4_Stream_Video_Slave_TDATA,
           AXI4_Stream_Video_Slave_TVALID,
           AXI4_Stream_Video_Slave_TLAST,
           AXI4_Stream_Video_Slave_TUSER,
           AXI4_Lite_ACLK,
           AXI4_Lite_ARESETN,
           AXI4_Lite_AWADDR,
           AXI4_Lite_AWVALID,
           AXI4_Lite_WDATA,
           AXI4_Lite_WSTRB,
           AXI4_Lite_WVALID,
           AXI4_Lite_BREADY,
           AXI4_Lite_ARADDR,
           AXI4_Lite_ARVALID,
           AXI4_Lite_RREADY,
           AXI4_Stream_Video_Master_TDATA,
           AXI4_Stream_Video_Master_TVALID,
           AXI4_Stream_Video_Master_TLAST,
           AXI4_Stream_Video_Master_TUSER,
           AXI4_Stream_Video_Slave_TREADY,
           AXI4_Lite_AWREADY,
           AXI4_Lite_WREADY,
           AXI4_Lite_BRESP,
           AXI4_Lite_BVALID,
           AXI4_Lite_ARREADY,
           AXI4_Lite_RDATA,
           AXI4_Lite_RRESP,
           AXI4_Lite_RVALID);


  input   IPCORE_CLK;  // ufix1
  input   IPCORE_RESETN;  // ufix1
  input   AXI4_Stream_Video_Master_TREADY;  // ufix1
  input   [31:0] AXI4_Stream_Video_Slave_TDATA;  // ufix32
  input   AXI4_Stream_Video_Slave_TVALID;  // ufix1
  input   AXI4_Stream_Video_Slave_TLAST;  // ufix1
  input   AXI4_Stream_Video_Slave_TUSER;  // ufix1
  input   AXI4_Lite_ACLK;  // ufix1
  input   AXI4_Lite_ARESETN;  // ufix1
  input   [15:0] AXI4_Lite_AWADDR;  // ufix16
  input   AXI4_Lite_AWVALID;  // ufix1
  input   [31:0] AXI4_Lite_WDATA;  // ufix32
  input   [3:0] AXI4_Lite_WSTRB;  // ufix4
  input   AXI4_Lite_WVALID;  // ufix1
  input   AXI4_Lite_BREADY;  // ufix1
  input   [15:0] AXI4_Lite_ARADDR;  // ufix16
  input   AXI4_Lite_ARVALID;  // ufix1
  input   AXI4_Lite_RREADY;  // ufix1
  output  [31:0] AXI4_Stream_Video_Master_TDATA;  // ufix32
  output  AXI4_Stream_Video_Master_TVALID;  // ufix1
  output  AXI4_Stream_Video_Master_TLAST;  // ufix1
  output  AXI4_Stream_Video_Master_TUSER;  // ufix1
  output  AXI4_Stream_Video_Slave_TREADY;  // ufix1
  output  AXI4_Lite_AWREADY;  // ufix1
  output  AXI4_Lite_WREADY;  // ufix1
  output  [1:0] AXI4_Lite_BRESP;  // ufix2
  output  AXI4_Lite_BVALID;  // ufix1
  output  AXI4_Lite_ARREADY;  // ufix1
  output  [31:0] AXI4_Lite_RDATA;  // ufix32
  output  [1:0] AXI4_Lite_RRESP;  // ufix2
  output  AXI4_Lite_RVALID;  // ufix1


  wire reset;
  wire enb;
  wire [31:0] ip_timestamp;  // ufix32
  wire reset_cm;  // ufix1
  wire reset_internal;  // ufix1
  wire reset_before_sync;  // ufix1
  wire write_axi_enable;  // ufix1
  wire [12:0] write_axi4_stream_video_slave_image_width;  // ufix13
  wire [12:0] write_axi4_stream_video_slave_image_height;  // ufix13
  wire [12:0] write_axi4_stream_video_slave_hporch;  // ufix13
  wire [12:0] write_axi4_stream_video_slave_vporch;  // ufix13
  wire const_1;  // ufix1
  wire validOut_valid_sig;  // ufix1
  wire top_user_ctrl_valid;  // ufix1
  wire validOut_vEnd_sig;  // ufix1
  wire top_user_ctrl_vEnd;  // ufix1
  wire validOut_vStart_sig;  // ufix1
  wire top_user_ctrl_vStart;  // ufix1
  wire validOut_hEnd_sig;  // ufix1
  wire top_user_ctrl_hEnd;  // ufix1
  wire validOut_hStart_sig;  // ufix1
  wire top_user_ctrl_hStart;  // ufix1
  wire top_user_ctrl_valid_1;  // ufix1
  wire ctrl_valid_sig;  // ufix1
  wire top_user_ctrl_vEnd_1;  // ufix1
  wire ctrl_vEnd_sig;  // ufix1
  wire top_user_ctrl_vStart_1;  // ufix1
  wire ctrl_vStart_sig;  // ufix1
  wire top_user_ctrl_hEnd_1;  // ufix1
  wire ctrl_hEnd_sig;  // ufix1
  wire top_user_ctrl_hStart_1;  // ufix1
  wire ctrl_hStart_sig;  // ufix1
  wire auto_ready_axi4_stream_video_master;  // ufix1
  wire [31:0] top_user_pixel;  // ufix32
  reg  auto_ready_dut_enb;  // ufix1
  wire dut_enable;  // ufix1
  wire ce_out_sig;  // ufix1
  wire [31:0] frameOut_sig;  // ufix32


  assign ip_timestamp = 32'b01111101011010110110101111001010;



  assign reset_cm =  ~ IPCORE_RESETN;



  assign reset_before_sync = reset_cm | reset_internal;



  SGBMHDLAl_ip_reset_sync u_SGBMHDLAl_ip_reset_sync_inst (.clk(IPCORE_CLK),  // ufix1
                                                          .reset_in(reset_before_sync),  // ufix1
                                                          .reset_out(reset)
                                                          );

  SGBMHDLAl_ip_axi_lite u_SGBMHDLAl_ip_axi_lite_inst (.reset(reset),
                                                      .AXI4_Lite_ACLK(AXI4_Lite_ACLK),  // ufix1
                                                      .AXI4_Lite_ARESETN(AXI4_Lite_ARESETN),  // ufix1
                                                      .AXI4_Lite_AWADDR(AXI4_Lite_AWADDR),  // ufix16
                                                      .AXI4_Lite_AWVALID(AXI4_Lite_AWVALID),  // ufix1
                                                      .AXI4_Lite_WDATA(AXI4_Lite_WDATA),  // ufix32
                                                      .AXI4_Lite_WSTRB(AXI4_Lite_WSTRB),  // ufix4
                                                      .AXI4_Lite_WVALID(AXI4_Lite_WVALID),  // ufix1
                                                      .AXI4_Lite_BREADY(AXI4_Lite_BREADY),  // ufix1
                                                      .AXI4_Lite_ARADDR(AXI4_Lite_ARADDR),  // ufix16
                                                      .AXI4_Lite_ARVALID(AXI4_Lite_ARVALID),  // ufix1
                                                      .AXI4_Lite_RREADY(AXI4_Lite_RREADY),  // ufix1
                                                      .read_ip_timestamp(ip_timestamp),  // ufix32
                                                      .AXI4_Lite_AWREADY(AXI4_Lite_AWREADY),  // ufix1
                                                      .AXI4_Lite_WREADY(AXI4_Lite_WREADY),  // ufix1
                                                      .AXI4_Lite_BRESP(AXI4_Lite_BRESP),  // ufix2
                                                      .AXI4_Lite_BVALID(AXI4_Lite_BVALID),  // ufix1
                                                      .AXI4_Lite_ARREADY(AXI4_Lite_ARREADY),  // ufix1
                                                      .AXI4_Lite_RDATA(AXI4_Lite_RDATA),  // ufix32
                                                      .AXI4_Lite_RRESP(AXI4_Lite_RRESP),  // ufix2
                                                      .AXI4_Lite_RVALID(AXI4_Lite_RVALID),  // ufix1
                                                      .write_axi_enable(write_axi_enable),  // ufix1
                                                      .write_axi4_stream_video_slave_image_width(write_axi4_stream_video_slave_image_width),  // ufix13
                                                      .write_axi4_stream_video_slave_image_height(write_axi4_stream_video_slave_image_height),  // ufix13
                                                      .write_axi4_stream_video_slave_hporch(write_axi4_stream_video_slave_hporch),  // ufix13
                                                      .write_axi4_stream_video_slave_vporch(write_axi4_stream_video_slave_vporch),  // ufix13
                                                      .reset_internal(reset_internal)  // ufix1
                                                      );

  assign const_1 = 1'b1;



  assign enb = const_1;

  assign top_user_ctrl_valid = validOut_valid_sig;



  assign top_user_ctrl_vEnd = validOut_vEnd_sig;



  assign top_user_ctrl_vStart = validOut_vStart_sig;



  assign top_user_ctrl_hEnd = validOut_hEnd_sig;



  assign top_user_ctrl_hStart = validOut_hStart_sig;



  assign ctrl_valid_sig = top_user_ctrl_valid_1;



  assign ctrl_vEnd_sig = top_user_ctrl_vEnd_1;



  assign ctrl_vStart_sig = top_user_ctrl_vStart_1;



  assign ctrl_hEnd_sig = top_user_ctrl_hEnd_1;



  assign ctrl_hStart_sig = top_user_ctrl_hStart_1;



  SGBMHDLAl_ip_axi4_stream_video_slave u_SGBMHDLAl_ip_axi4_stream_video_slave_inst (.clk(IPCORE_CLK),  // ufix1
                                                                                    .reset(reset),
                                                                                    .enb(const_1),
                                                                                    .AXI4_Stream_Video_Slave_TDATA(AXI4_Stream_Video_Slave_TDATA),  // ufix32
                                                                                    .AXI4_Stream_Video_Slave_TVALID(AXI4_Stream_Video_Slave_TVALID),  // ufix1
                                                                                    .AXI4_Stream_Video_Slave_TLAST(AXI4_Stream_Video_Slave_TLAST),  // ufix1
                                                                                    .AXI4_Stream_Video_Slave_TUSER(AXI4_Stream_Video_Slave_TUSER),  // ufix1
                                                                                    .auto_ready(auto_ready_axi4_stream_video_master),  // ufix1
                                                                                    .write_axi4_stream_video_slave_image_width(write_axi4_stream_video_slave_image_width),  // ufix13
                                                                                    .write_axi4_stream_video_slave_image_height(write_axi4_stream_video_slave_image_height),  // ufix13
                                                                                    .write_axi4_stream_video_slave_hporch(write_axi4_stream_video_slave_hporch),  // ufix13
                                                                                    .write_axi4_stream_video_slave_vporch(write_axi4_stream_video_slave_vporch),  // ufix13
                                                                                    .AXI4_Stream_Video_Slave_TREADY(AXI4_Stream_Video_Slave_TREADY),  // ufix1
                                                                                    .user_pixel(top_user_pixel),  // ufix32
                                                                                    .user_ctrl_hStart(top_user_ctrl_hStart_1),  // ufix1
                                                                                    .user_ctrl_hEnd(top_user_ctrl_hEnd_1),  // ufix1
                                                                                    .user_ctrl_vStart(top_user_ctrl_vStart_1),  // ufix1
                                                                                    .user_ctrl_vEnd(top_user_ctrl_vEnd_1),  // ufix1
                                                                                    .user_ctrl_valid(top_user_ctrl_valid_1)  // ufix1
                                                                                    );

  always @(posedge IPCORE_CLK or posedge reset)
    begin : reg_rsvd_process
      if (reset == 1'b1) begin
        auto_ready_dut_enb <= 1'b0;
      end
      else begin
        if (enb) begin
          auto_ready_dut_enb <= auto_ready_axi4_stream_video_master;
        end
      end
    end



  assign dut_enable = write_axi_enable & auto_ready_dut_enb;



  SGBMHDLAl_ip_dut u_SGBMHDLAl_ip_dut_inst (.clk(IPCORE_CLK),  // ufix1
                                            .reset(reset),
                                            .dut_enable(dut_enable),  // ufix1
                                            .RGB(top_user_pixel),  // ufix32
                                            .ctrl_hStart(ctrl_hStart_sig),  // ufix1
                                            .ctrl_hEnd(ctrl_hEnd_sig),  // ufix1
                                            .ctrl_vStart(ctrl_vStart_sig),  // ufix1
                                            .ctrl_vEnd(ctrl_vEnd_sig),  // ufix1
                                            .ctrl_valid(ctrl_valid_sig),  // ufix1
                                            .ce_out(ce_out_sig),  // ufix1
                                            .frameOut(frameOut_sig),  // ufix32
                                            .validOut_hStart(validOut_hStart_sig),  // ufix1
                                            .validOut_hEnd(validOut_hEnd_sig),  // ufix1
                                            .validOut_vStart(validOut_vStart_sig),  // ufix1
                                            .validOut_vEnd(validOut_vEnd_sig),  // ufix1
                                            .validOut_valid(validOut_valid_sig)  // ufix1
                                            );

  SGBMHDLAl_ip_axi4_stream_video_master u_SGBMHDLAl_ip_axi4_stream_video_master_inst (.clk(IPCORE_CLK),  // ufix1
                                                                                      .reset(reset),
                                                                                      .enb(const_1),
                                                                                      .AXI4_Stream_Video_Master_TREADY(AXI4_Stream_Video_Master_TREADY),  // ufix1
                                                                                      .user_pixel(frameOut_sig),  // ufix32
                                                                                      .user_ctrl_hStart(top_user_ctrl_hStart),  // ufix1
                                                                                      .user_ctrl_hEnd(top_user_ctrl_hEnd),  // ufix1
                                                                                      .user_ctrl_vStart(top_user_ctrl_vStart),  // ufix1
                                                                                      .user_ctrl_vEnd(top_user_ctrl_vEnd),  // ufix1
                                                                                      .user_ctrl_valid(top_user_ctrl_valid),  // ufix1
                                                                                      .AXI4_Stream_Video_Master_TDATA(AXI4_Stream_Video_Master_TDATA),  // ufix32
                                                                                      .AXI4_Stream_Video_Master_TVALID(AXI4_Stream_Video_Master_TVALID),  // ufix1
                                                                                      .AXI4_Stream_Video_Master_TLAST(AXI4_Stream_Video_Master_TLAST),  // ufix1
                                                                                      .AXI4_Stream_Video_Master_TUSER(AXI4_Stream_Video_Master_TUSER),  // ufix1
                                                                                      .auto_ready(auto_ready_axi4_stream_video_master)  // ufix1
                                                                                      );

endmodule  // SGBMHDLAl_ip
