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

@test "Ignore files with deprecated _content-type" {
  run run_vale "$BATS_TEST_FILENAME" ignore_content_type.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore files with deprecated _module-type" {
  run run_vale "$BATS_TEST_FILENAME" ignore_module_type.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore files with _mod-docs-content-type" {
  run run_vale "$BATS_TEST_FILENAME" ignore_module_type.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report files with _mod-docs-content-type in line comment" {
  run run_vale "$BATS_TEST_FILENAME" report_comments.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_comments.adoc:1:1:AsciiDocDITA.ContentType:The '_mod-docs-content-type' attribute definition is missing." ]
}

@test "Report files with _mod-docs-content-type without value" {
  run run_vale "$BATS_TEST_FILENAME" report_missing_value.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_missing_value.adoc:1:1:AsciiDocDITA.ContentType:The '_mod-docs-content-type' attribute definition is missing." ]
}

@test "Report files without _mod-docs-content-type" {
  run run_vale "$BATS_TEST_FILENAME" report_missing_type.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_missing_type.adoc:1:1:AsciiDocDITA.ContentType:The '_mod-docs-content-type' attribute definition is missing." ]
}
