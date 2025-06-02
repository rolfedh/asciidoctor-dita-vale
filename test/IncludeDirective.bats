load test_helper

@test "Ignore include directives in line comments" {
  run run_vale "$BATS_TEST_FILENAME" ignore_comments.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore escaped include directives" {
  run run_vale "$BATS_TEST_FILENAME" ignore_escapes.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report include directive variations" {
  run run_vale "$BATS_TEST_FILENAME" report_includes.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 5 ]
  [ "${lines[0]}" = "report_includes.adoc:3:1:AsciiDocDITA.IncludeDirective:include::file.adoc[]" ]
  [ "${lines[1]}" = "report_includes.adoc:4:1:AsciiDocDITA.IncludeDirective:include::../relative/path/to/sample-file.adoc[]" ]
  [ "${lines[2]}" = "report_includes.adoc:5:1:AsciiDocDITA.IncludeDirective:include::file.adoc[leveloffset=+1]" ]
  [ "${lines[3]}" = "report_includes.adoc:6:1:AsciiDocDITA.IncludeDirective:include::file.adoc[tag=!*]" ]
  [ "${lines[4]}" = "report_includes.adoc:7:1:AsciiDocDITA.IncludeDirective:include::file.adoc[leveloffset=+2,tag=!pre-5.9]" ]
}
