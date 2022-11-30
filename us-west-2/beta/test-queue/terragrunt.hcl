terraform {
  source = "git@github.com:kangkyu/many-queues-terraform.git//sqs-queue?ref=master"
}

include "root" {
  path = find_in_parent_folders()
}

inputs = {
  sqs_prefix = "test-queue"
  env_name   = "beta"
}
