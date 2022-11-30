terraform {
  source = "https://github.com/kangkyu/many-queues-terraform.git//sqs-queue?ref=main"
}

include "root" {
  path = find_in_parent_folders()
}

inputs = {
  sqs_prefix = "test-queue"
  env_name   = "prod"
}
