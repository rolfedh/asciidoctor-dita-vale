load test_helper

@test "Ignore conditional directives in line comments" {
  run run_vale "$BATS_TEST_FILENAME" ignore_comments.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore escaped conditional directives" {
  run run_vale "$BATS_TEST_FILENAME" ignore_escapes.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report conditional directive variations" {
  run run_vale "$BATS_TEST_FILENAME" report_conditionals.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 5 ]
  [ "${lines[0]}" = "report_conditionals.adoc:3:1:AsciiDocDITA.ConditionalCode:ifdef::beginner-content[]" ]
  [ "${lines[1]}" = "report_conditionals.adoc:7:1:AsciiDocDITA.ConditionalCode:ifdef::beginner-content[A paragraph.]" ]
  [ "${lines[2]}" = "report_conditionals.adoc:9:1:AsciiDocDITA.ConditionalCode:ifndef::beginner-content[]" ]
  [ "${lines[3]}" = "report_conditionals.adoc:13:1:AsciiDocDITA.ConditionalCode:ifndef::beginner-content[A paragraph.]" ]
  [ "${lines[4]}" = "report_conditionals.adoc:15:1:AsciiDocDITA.ConditionalCode:ifeval::[\"{version-number}\" == \"1.0.0\"]" ]
}
