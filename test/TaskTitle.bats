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

@test "Ignore block titles inside of block comments" {
  run run_vale "$BATS_TEST_FILENAME" ignore_comments.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore block titles in other content types" {
  run run_vale "$BATS_TEST_FILENAME" ignore_other_modules.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore block titles in undefined content types" {
  run run_vale "$BATS_TEST_FILENAME" ignore_unknown_modules.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore supported block titles" {
  run run_vale "$BATS_TEST_FILENAME" ignore_supported_titles.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore steps that have similar syntax to block titles" {
  run run_vale "$BATS_TEST_FILENAME" ignore_steps.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report block titles in procedures with deprecated _content-type" {
  run run_vale "$BATS_TEST_FILENAME" report_content_type.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_content_type.adoc:8:1:AsciiDocDITA.TaskTitle:Unsupported titles cannot be mapped to DITA tasks." ]
}

@test "Report block titles in procedures with deprecated _module-type" {
  run run_vale "$BATS_TEST_FILENAME" report_module_type.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_module_type.adoc:8:1:AsciiDocDITA.TaskTitle:Unsupported titles cannot be mapped to DITA tasks." ]
}

@test "Report unsupported block titles in procedure modules" {
  run run_vale "$BATS_TEST_FILENAME" report_unknown_titles.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 2 ]
  [ "${lines[0]}" = "report_unknown_titles.adoc:8:1:AsciiDocDITA.TaskTitle:Unsupported titles cannot be mapped to DITA tasks." ]
  [ "${lines[1]}" = "report_unknown_titles.adoc:12:1:AsciiDocDITA.TaskTitle:Unsupported titles cannot be mapped to DITA tasks." ]
}
