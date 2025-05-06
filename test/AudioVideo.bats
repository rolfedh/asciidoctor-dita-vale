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
