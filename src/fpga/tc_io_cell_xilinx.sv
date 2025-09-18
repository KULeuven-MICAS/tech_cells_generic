// Copyright 2025 KU Leuven.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51

// Author: Yunhao Deng <yunhao.deng@kuleuven.be>

module tc_analog_io (
    inout logic io
);
  // Nothing needed for FPGA implementation
endmodule

module tc_digital_io (
    // Input data
    input logic data_i,
    // Output data
    output logic data_o,
    // IO interface towards pad + ctrl
    input logic io_direction_oe_ni,
    input logic [3:0] io_driving_strength_i,
    input logic io_pullup_en_i,
    input logic io_pulldown_en_i,
    inout logic io
);

  IOBUF #(
      .DRIVE(12),
      .IBUF_LOW_PWR("FALSE"),
      .IOSTANDARD("DEFAULT"),
      .SLEW("HIGH")
  ) i_digital_io (
      .O (data_o),
      .IO(io),
      .I (data_i),
      .T (io_direction_oe_ni)
  );

endmodule
