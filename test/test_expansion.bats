#!/usr/bin/env bats

# load custom assertions and functions
load bats_helper


# setup is run beofre each test
function setup {
  INPUT_PROJECT_CONFIG=${BATS_TMPDIR}/input_config-${BATS_TEST_NUMBER}
  PROCESSED_PROJECT_CONFIG=${BATS_TMPDIR}/packed_config-${BATS_TEST_NUMBER} 
  JSON_PROJECT_CONFIG=${BATS_TMPDIR}/json_config-${BATS_TEST_NUMBER} 
	echo "#using temp file ${BATS_TMPDIR}/"

  # the name used in example config files.
  INLINE_ORB_NAME="webhook"
}


@test "Job: full job expands properly" {
  # given
  process_config_with test/inputs/command-defaults.yml

  # when
  assert_jq_match '.jobs | length' 1 #only 1 job
  assert_jq_match '.jobs["build"].steps | length' 3

  assert_jq_match '.jobs["build"].steps[0].run.when' always
  assert_jq_match '.jobs["build"].steps[0].run.name' "Bundle build info into webhook payload"

  assert_jq_match '.jobs["build"].steps[1].run.when' on_success
  assert_jq_match '.jobs["build"].steps[1].run.name' "Notify https://requestbin.fullcontact.com/1f6b6vc1 with Success Webhook"

  assert_jq_match '.jobs["build"].steps[2].run.when' on_fail
  assert_jq_match '.jobs["build"].steps[2].run.name' "Notify https://requestbin.fullcontact.com/1f6b6vc1 with Failure Webhook"


}
