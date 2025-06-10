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
  [ "$status" -ne 0 ]
  [ "${#lines[@]}" -eq 4 ]
  [ "${lines[0]}" = "report_nested_section.adoc:2:1:AsciiDocDITA.NestedSection:Level 2, 3, 4, and 5 sections are not supported in DITA." ]
  [ "${lines[1]}" = "report_nested_section.adoc:5:1:AsciiDocDITA.NestedSection:Level 2, 3, 4, and 5 sections are not supported in DITA." ]
  [ "${lines[2]}" = "report_nested_section.adoc:8:1:AsciiDocDITA.NestedSection:Level 2, 3, 4, and 5 sections are not supported in DITA." ]
  [ "${lines[3]}" = "report_nested_section.adoc:11:1:AsciiDocDITA.NestedSection:Level 2, 3, 4, and 5 sections are not supported in DITA." ]
}
