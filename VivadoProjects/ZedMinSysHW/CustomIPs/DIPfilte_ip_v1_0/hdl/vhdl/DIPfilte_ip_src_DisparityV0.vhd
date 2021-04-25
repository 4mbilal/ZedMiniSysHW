-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\Disparity_CT\DIPfilte_ip_src_DisparityV0.vhd
-- Created: 2021-04-25 08:25:31
-- 
-- Generated by MATLAB 9.10 and HDL Coder 3.18
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: 0.001
-- Target subsystem base rate: 0.001
-- 
-- 
-- Clock Enable  Sample Time
-- -------------------------------------------------------------
-- ce_out        0.001
-- -------------------------------------------------------------
-- 
-- 
-- Output Signal                 Clock Enable  Sample Time
-- -------------------------------------------------------------
-- pixelOut                      ce_out        0.001
-- ctrlOut_hStart                ce_out        0.001
-- ctrlOut_hEnd                  ce_out        0.001
-- ctrlOut_vStart                ce_out        0.001
-- ctrlOut_vEnd                  ce_out        0.001
-- ctrlOut_valid                 ce_out        0.001
-- -------------------------------------------------------------
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: DIPfilte_ip_src_DisparityV0
-- Source Path: Disparity_CT/DisparityV0
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY DIPfilte_ip_src_DisparityV0 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        pixelIn                           :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        ctrlIn_hStart                     :   IN    std_logic;
        ctrlIn_hEnd                       :   IN    std_logic;
        ctrlIn_vStart                     :   IN    std_logic;
        ctrlIn_vEnd                       :   IN    std_logic;
        ctrlIn_valid                      :   IN    std_logic;
        ce_out                            :   OUT   std_logic;
        pixelOut                          :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        ctrlOut_hStart                    :   OUT   std_logic;
        ctrlOut_hEnd                      :   OUT   std_logic;
        ctrlOut_vStart                    :   OUT   std_logic;
        ctrlOut_vEnd                      :   OUT   std_logic;
        ctrlOut_valid                     :   OUT   std_logic
        );
END DIPfilte_ip_src_DisparityV0;


ARCHITECTURE rtl OF DIPfilte_ip_src_DisparityV0 IS

  -- Component Declarations
  COMPONENT DIPfilte_ip_src_ct
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          pixelIn                         :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          Enable                          :   IN    std_logic;
          pixelOut                        :   OUT   std_logic_vector(31 DOWNTO 0)  -- uint32
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : DIPfilte_ip_src_ct
    USE ENTITY work.DIPfilte_ip_src_ct(rtl);

  -- Signals
  SIGNAL pixelIn_unsigned                 : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Bit_Slice_out1                   : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL valid                            : std_logic;
  SIGNAL ct_out1                          : std_logic_vector(31 DOWNTO 0);  -- ufix32

BEGIN
  u_ct : DIPfilte_ip_src_ct
    PORT MAP( clk => clk,
              reset => reset,
              enb => clk_enable,
              pixelIn => std_logic_vector(Bit_Slice_out1),  -- uint8
              Enable => valid,
              pixelOut => ct_out1  -- uint32
              );

  pixelIn_unsigned <= unsigned(pixelIn);

  Bit_Slice_out1 <= pixelIn_unsigned(23 DOWNTO 16);

  valid <= ctrlIn_valid;

  ce_out <= clk_enable;

  pixelOut <= ct_out1;

  ctrlOut_hStart <= ctrlIn_hStart;

  ctrlOut_hEnd <= ctrlIn_hEnd;

  ctrlOut_vStart <= ctrlIn_vStart;

  ctrlOut_vEnd <= ctrlIn_vEnd;

  ctrlOut_valid <= ctrlIn_valid;

END rtl;
