load test_helper

@test "Ignore files with [role=\"_abstract\"]" {
  run run_vale "$BATS_TEST_FILENAME" ignore_defined_abstract.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report files with [role=\"_abstract\"] in line comment" {
  run run_vale "$BATS_TEST_FILENAME" report_comments.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_comments.adoc:1:1:AsciiDocDITA.ShortDescription:Assign [role=\"_abstract\"] to a paragraph to use it as <shortdesc> in DITA." ]
}

@test "Report files without [role=\"_abstract\"]" {
  run run_vale "$BATS_TEST_FILENAME" report_missing_abstract.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_missing_abstract.adoc:1:1:AsciiDocDITA.ShortDescription:Assign [role=\"_abstract\"] to a paragraph to use it as <shortdesc> in DITA." ]
}
