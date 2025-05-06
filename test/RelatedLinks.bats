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

@test "Ignore content inside of line and block comments" {
  run run_vale "$BATS_TEST_FILENAME" ignore_comments.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore content in other sections" {
  run run_vale "$BATS_TEST_FILENAME" ignore_other_sections.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore valid lines with all link variations" {
  run run_vale "$BATS_TEST_FILENAME" ignore_valid_lines.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report content other than links in additional resources" {
  run run_vale "$BATS_TEST_FILENAME" report_non_links.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 3 ]
  [ "${lines[0]}" = "report_non_links.adoc:4:1:AsciiDocDITA.RelatedLinks:Content other than links cannot be mapped to DITA related-links." ]
  [ "${lines[1]}" = "report_non_links.adoc:6:1:AsciiDocDITA.RelatedLinks:Content other than links cannot be mapped to DITA related-links." ]
  [ "${lines[2]}" = "report_non_links.adoc:7:1:AsciiDocDITA.RelatedLinks:Content other than links cannot be mapped to DITA related-links." ]
}

@test "Recognize additional resources title variations" {
  run run_vale "$BATS_TEST_FILENAME" report_valid_sections.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 3 ]
  [ "${lines[0]}" = "report_valid_sections.adoc:4:1:AsciiDocDITA.RelatedLinks:Content other than links cannot be mapped to DITA related-links." ]
  [ "${lines[1]}" = "report_valid_sections.adoc:6:1:AsciiDocDITA.RelatedLinks:Content other than links cannot be mapped to DITA related-links." ]
  [ "${lines[2]}" = "report_valid_sections.adoc:7:1:AsciiDocDITA.RelatedLinks:Content other than links cannot be mapped to DITA related-links." ]
}
