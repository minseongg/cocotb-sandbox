// This file is public domain, it can be freely copied without restrictions.
// SPDX-License-Identifier: CC0-1.0

module my_design(input logic clk, output logic out);
  timeunit 1ns;
  timeprecision 1ns;

  logic a = 0;

  always @(posedge clk) begin
    a = !a;
  end

  assign out = a;
endmodule
