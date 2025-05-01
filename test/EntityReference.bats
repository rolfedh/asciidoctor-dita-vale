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

@test "Ignore character entity references inside of comments" {
  run run_vale "$BATS_TEST_FILENAME" ignore_comments.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore numeric character references" {
  run run_vale "$BATS_TEST_FILENAME" ignore_numeric_references.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore supported character entity references" {
  run run_vale "$BATS_TEST_FILENAME" ignore_supported_entities.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report unsupported character entity references" {
  run run_vale "$BATS_TEST_FILENAME" report_entity_references.adoc
  [ "$status" -ne 0 ]
  [ "${#lines[@]}" -eq 2 ]
  [ "${lines[0]}" = "report_entity_references.adoc:3:3:AsciiDocDITA.EntityReference:HTML character entity references are not supported in DITA." ]
  [ "${lines[1]}" = "report_entity_references.adoc:4:3:AsciiDocDITA.EntityReference:HTML character entity references are not supported in DITA." ]
}

@test "Report all character entity references on single line" {
  run run_vale "$BATS_TEST_FILENAME" report_multiple_references.adoc
  [ "$status" -ne 0 ]
  [ "${#lines[@]}" -eq 4 ]
  [ "${lines[0]}" = "report_multiple_references.adoc:3:3:AsciiDocDITA.EntityReference:HTML character entity references are not supported in DITA." ]
  [ "${lines[1]}" = "report_multiple_references.adoc:3:36:AsciiDocDITA.EntityReference:HTML character entity references are not supported in DITA." ]
  [ "${lines[2]}" = "report_multiple_references.adoc:3:94:AsciiDocDITA.EntityReference:HTML character entity references are not supported in DITA." ]
  [ "${lines[3]}" = "report_multiple_references.adoc:3:125:AsciiDocDITA.EntityReference:HTML character entity references are not supported in DITA." ]
}
