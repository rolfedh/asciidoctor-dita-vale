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

@test "Ignore admonition titles inside of line and block comments" {
  run run_vale "$BATS_TEST_FILENAME" ignore_comments.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore steps that have similar syntax to admonition titles" {
  run run_vale "$BATS_TEST_FILENAME" ignore_steps.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report admonition title variations" {
  run run_vale "$BATS_TEST_FILENAME" report_admonition_title.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 13 ]
  [ "${lines[0]}" = "report_admonition_title.adoc:2:1:AsciiDocDITA.AdmonitionTitle:Admonition titles are not supported in DITA." ]
  [ "${lines[1]}" = "report_admonition_title.adoc:8:1:AsciiDocDITA.AdmonitionTitle:Admonition titles are not supported in DITA." ]
  [ "${lines[2]}" = "report_admonition_title.adoc:14:1:AsciiDocDITA.AdmonitionTitle:Admonition titles are not supported in DITA." ]
  [ "${lines[3]}" = "report_admonition_title.adoc:20:1:AsciiDocDITA.AdmonitionTitle:Admonition titles are not supported in DITA." ]
  [ "${lines[4]}" = "report_admonition_title.adoc:26:1:AsciiDocDITA.AdmonitionTitle:Admonition titles are not supported in DITA." ]
  [ "${lines[5]}" = "report_admonition_title.adoc:33:1:AsciiDocDITA.AdmonitionTitle:Admonition titles are not supported in DITA." ]
  [ "${lines[6]}" = "report_admonition_title.adoc:36:1:AsciiDocDITA.AdmonitionTitle:Admonition titles are not supported in DITA." ]
  [ "${lines[7]}" = "report_admonition_title.adoc:39:1:AsciiDocDITA.AdmonitionTitle:Admonition titles are not supported in DITA." ]
  [ "${lines[8]}" = "report_admonition_title.adoc:42:1:AsciiDocDITA.AdmonitionTitle:Admonition titles are not supported in DITA." ]
  [ "${lines[9]}" = "report_admonition_title.adoc:45:1:AsciiDocDITA.AdmonitionTitle:Admonition titles are not supported in DITA." ]
  [ "${lines[10]}" = "report_admonition_title.adoc:50:1:AsciiDocDITA.AdmonitionTitle:Admonition titles are not supported in DITA." ]
  [ "${lines[11]}" = "report_admonition_title.adoc:56:1:AsciiDocDITA.AdmonitionTitle:Admonition titles are not supported in DITA." ]
  [ "${lines[12]}" = "report_admonition_title.adoc:67:1:AsciiDocDITA.AdmonitionTitle:Admonition titles are not supported in DITA." ]
}
