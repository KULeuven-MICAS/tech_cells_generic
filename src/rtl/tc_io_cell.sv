// Copyright 2025 KU Leuven.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51

// Author: Yunhao Deng <yunhao.deng@kuleuven.be>

module tc_analog_io #(
    parameter int VerticalIO = 0
) (
    inout wire io
);
  assign io = 1'bz;
endmodule

module tc_digital_io #(
    parameter int VerticalIO = 0
) (
    // Input data
    input wire data_i,
    // Output data
    output wire data_o,
    // IO interface towards pad + ctrl
    input wire io_direction_oe_ni,
    input wire [3:0] io_driving_strength_i,
    input wire io_pullup_en_i,
    input wire io_pulldown_en_i,
    inout wire io
);

`ifndef VERILATOR
  // Pull-ups and pull-downs
  assign (weak1, weak0) io = io_pullup_en_i ? 1'b1 : 1'bz;
  assign (weak0, weak1) io = io_pulldown_en_i ? 1'b0 : 1'bz;
`endif

  // IO chip -> pad
  assign io = io_direction_oe_ni ? 1'bz : data_i;

  // IO pad -> chip
  assign data_o = io;

endmodule
