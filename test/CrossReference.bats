load test_helper

@test "Ignore document to document cross reference variations" {
  run run_vale "$BATS_TEST_FILENAME" ignore_valid_references.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report cross references to external IDs" {
  run run_vale "$BATS_TEST_FILENAME" report_reference_ids.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 6 ]
  [ "${lines[0]}" = "report_reference_ids.adoc:3:20:AsciiDocDITA.CrossReference:Cross references to external IDs cannot be converted to DITA." ]
  [ "${lines[1]}" = "report_reference_ids.adoc:3:75:AsciiDocDITA.CrossReference:Cross references to external IDs cannot be converted to DITA." ]
  [ "${lines[2]}" = "report_reference_ids.adoc:5:20:AsciiDocDITA.CrossReference:Cross references to external IDs cannot be converted to DITA." ]
  [ "${lines[3]}" = "report_reference_ids.adoc:5:78:AsciiDocDITA.CrossReference:Cross references to external IDs cannot be converted to DITA." ]
  [ "${lines[4]}" = "report_reference_ids.adoc:7:20:AsciiDocDITA.CrossReference:Cross references to external IDs cannot be converted to DITA." ]
  [ "${lines[5]}" = "report_reference_ids.adoc:7:80:AsciiDocDITA.CrossReference:Cross references to external IDs cannot be converted to DITA." ]
}
