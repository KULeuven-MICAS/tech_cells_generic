// Copyright 2025 KU Leuven.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51

// Author: Yunhao Deng <yunhao.deng@kuleuven.be>

module tc_analog_io (
    inout logic io
);
    assign io = 1'bz;
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

// Pull-ups and pull-downs
assign (weak1, weak0) io = io_pullup_en_i ? 1'b1 : 1'bz;
assign (weak0, weak1) io = io_pulldown_en_i ? 1'b0 : 1'bz;

// IO chip -> pad
assign io = io_direction_oe_ni ? 1'bz : data_i;

// IO pad -> chip
assign data_o = io;

endmodule
