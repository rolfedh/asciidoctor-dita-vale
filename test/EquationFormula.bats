# Copyright (C) 2025 Jaromir Hradilek

# MIT License
#
# Permission  is hereby granted,  free of charge,  to any person  obtaining
# a copy of  this software  and associated documentation files  (the "Soft-
# ware"),  to deal in the Software  without restriction,  including without
# limitation the rights to use,  copy, modify, merge,  publish, distribute,
# sublicense, and/or sell copies of the Software,  and to permit persons to
# whom the Software is furnished to do so,  subject to the following condi-
# tions:
#
# The above copyright notice  and this permission notice  shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS",  WITHOUT WARRANTY OF ANY KIND,  EXPRESS
# OR IMPLIED,  INCLUDING BUT NOT LIMITED TO  THE WARRANTIES OF MERCHANTABI-
# LITY,  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT
# SHALL THE AUTHORS OR COPYRIGHT HOLDERS  BE LIABLE FOR ANY CLAIM,  DAMAGES
# OR OTHER LIABILITY,  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM,  OUT OF OR IN CONNECTION WITH  THE SOFTWARE  OR  THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.

load test_helper

@test "Report block STEM content" {
  run run_vale "$BATS_TEST_FILENAME" report_block_stem.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 6 ]
  [ "${lines[0]}" = "report_block_stem.adoc:2:1:AsciiDocDITA.EquationFormula:Equations and formulas are not implemented." ]
  [ "${lines[1]}" = "report_block_stem.adoc:4:1:AsciiDocDITA.EquationFormula:Equations and formulas are not implemented." ]
  [ "${lines[2]}" = "report_block_stem.adoc:9:1:AsciiDocDITA.EquationFormula:Equations and formulas are not implemented." ]
  [ "${lines[3]}" = "report_block_stem.adoc:15:1:AsciiDocDITA.EquationFormula:Equations and formulas are not implemented." ]
  [ "${lines[4]}" = "report_block_stem.adoc:17:1:AsciiDocDITA.EquationFormula:Equations and formulas are not implemented." ]
  [ "${lines[5]}" = "report_block_stem.adoc:22:1:AsciiDocDITA.EquationFormula:Equations and formulas are not implemented." ]
}

@test "Report inline STEM content" {
  run run_vale "$BATS_TEST_FILENAME" report_inline_stem.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 6 ]
  [ "${lines[0]}" = "report_inline_stem.adoc:2:1:AsciiDocDITA.EquationFormula:Equations and formulas are not implemented." ]
  [ "${lines[1]}" = "report_inline_stem.adoc:4:1:AsciiDocDITA.EquationFormula:Equations and formulas are not implemented." ]
  [ "${lines[2]}" = "report_inline_stem.adoc:6:21:AsciiDocDITA.EquationFormula:Equations and formulas are not implemented." ]
  [ "${lines[3]}" = "report_inline_stem.adoc:9:1:AsciiDocDITA.EquationFormula:Equations and formulas are not implemented." ]
  [ "${lines[4]}" = "report_inline_stem.adoc:11:1:AsciiDocDITA.EquationFormula:Equations and formulas are not implemented." ]
  [ "${lines[5]}" = "report_inline_stem.adoc:13:21:AsciiDocDITA.EquationFormula:Equations and formulas are not implemented." ]
}
