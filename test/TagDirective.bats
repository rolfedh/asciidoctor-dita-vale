load test_helper

@test "Report tag directive variations" {
  run run_vale "$BATS_TEST_FILENAME" report_tags.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 2 ]
  [ "${lines[0]}" = "report_tags.adoc:3:1:AsciiDocDITA.TagDirective:tag::verbose[]" ]
  [ "${lines[1]}" = "report_tags.adoc:9:3:AsciiDocDITA.TagDirective:tag::verbose[]" ]
}

@test "Report tag directives in line comments" {
  run run_vale "$BATS_TEST_FILENAME" report_comments.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_comments.adoc:3:4:AsciiDocDITA.TagDirective:tag::verbose[]" ]
}
