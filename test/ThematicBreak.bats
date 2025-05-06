load test_helper

@test "Ignore thematic breaks in single-line comments" {
  run run_vale "$BATS_TEST_FILENAME" ignore_comments.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore document separators in YAML files" {
  run run_vale "$BATS_TEST_FILENAME" ignore_yaml_separators.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report valid thematic break variations" {
  run run_vale "$BATS_TEST_FILENAME" report_thematic_break.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 5 ]
  [ "${lines[0]}" = "report_thematic_break.adoc:9:1:AsciiDocDITA.ThematicBreak:Thematic breaks are not supported in DITA." ]
  [ "${lines[1]}" = "report_thematic_break.adoc:13:2:AsciiDocDITA.ThematicBreak:Thematic breaks are not supported in DITA." ]
  [ "${lines[2]}" = "report_thematic_break.adoc:17:2:AsciiDocDITA.ThematicBreak:Thematic breaks are not supported in DITA." ]
  [ "${lines[3]}" = "report_thematic_break.adoc:21:1:AsciiDocDITA.ThematicBreak:Thematic breaks are not supported in DITA." ]
  [ "${lines[4]}" = "report_thematic_break.adoc:25:1:AsciiDocDITA.ThematicBreak:Thematic breaks are not supported in DITA." ]
}
