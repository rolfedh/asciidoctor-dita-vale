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

@test "Ignore audio and video macros in single-line comments" {
  run run_vale "$BATS_TEST_FILENAME" ignore_comments.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore escaped audio and video macros" {
  run run_vale "$BATS_TEST_FILENAME" ignore_escapes.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore audio and video macros with leading spaces" {
  run run_vale "$BATS_TEST_FILENAME" ignore_leading_spaces.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore audio and video macros with trailing characters" {
  run run_vale "$BATS_TEST_FILENAME" ignore_trailing_content.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report valid audio macro variations" {
  run run_vale "$BATS_TEST_FILENAME" report_audio_macro.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 4 ]
  [ "${lines[0]}" = "report_audio_macro.adoc:2:1:AsciiDocDITA.AudioVideo:Audio and video macros are not implemented." ]
  [ "${lines[1]}" = "report_audio_macro.adoc:5:1:AsciiDocDITA.AudioVideo:Audio and video macros are not implemented." ]
  [ "${lines[2]}" = "report_audio_macro.adoc:9:1:AsciiDocDITA.AudioVideo:Audio and video macros are not implemented." ]
  [ "${lines[3]}" = "report_audio_macro.adoc:12:1:AsciiDocDITA.AudioVideo:Audio and video macros are not implemented." ]
}

@test "Report valid video macro variations" {
  run run_vale "$BATS_TEST_FILENAME" report_video_macro.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 5 ]
  [ "${lines[0]}" = "report_video_macro.adoc:2:1:AsciiDocDITA.AudioVideo:Audio and video macros are not implemented." ]
  [ "${lines[1]}" = "report_video_macro.adoc:5:1:AsciiDocDITA.AudioVideo:Audio and video macros are not implemented." ]
  [ "${lines[2]}" = "report_video_macro.adoc:8:1:AsciiDocDITA.AudioVideo:Audio and video macros are not implemented." ]
  [ "${lines[3]}" = "report_video_macro.adoc:12:1:AsciiDocDITA.AudioVideo:Audio and video macros are not implemented." ]
  [ "${lines[4]}" = "report_video_macro.adoc:15:1:AsciiDocDITA.AudioVideo:Audio and video macros are not implemented." ]
}
