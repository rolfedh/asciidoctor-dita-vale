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

@test "Ignore unsupported sections in single-line comments" {
  run run_vale "$BATS_TEST_FILENAME" ignore_comments.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore invalid sections" {
  run run_vale "$BATS_TEST_FILENAME" ignore_invalid_sections.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore valid sections" {
  run run_vale "$BATS_TEST_FILENAME" ignore_valid_sections.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report unsupported sections" {
  run run_vale "$BATS_TEST_FILENAME" report_nested_section.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 4 ]
  [ "${lines[0]}" = "report_nested_section.adoc:2:1:AsciiDocDITA.NestedSection:Level 2, 3, 4, and 5 sections are not supported in DITA." ]
  [ "${lines[1]}" = "report_nested_section.adoc:5:1:AsciiDocDITA.NestedSection:Level 2, 3, 4, and 5 sections are not supported in DITA." ]
  [ "${lines[2]}" = "report_nested_section.adoc:8:1:AsciiDocDITA.NestedSection:Level 2, 3, 4, and 5 sections are not supported in DITA." ]
  [ "${lines[3]}" = "report_nested_section.adoc:11:1:AsciiDocDITA.NestedSection:Level 2, 3, 4, and 5 sections are not supported in DITA." ]
}
