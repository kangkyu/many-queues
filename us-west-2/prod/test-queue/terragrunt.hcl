terraform {
  source = "git@github.com:kangkyu/many-queues-terraform.git//sqs-queue?ref=master"
}

generate "remote_state" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  backend "remote" {
    hostname = "app.terraform.io" # Change this to your hostname for TFE
    organization = "lining-link"
    workspaces {
      name = "many-queues-prod"
    }
  }
}
  EOF
}

generate "tfvars" {
  path      = "terragrunt.auto.tfvars.json"
  if_exists = "overwrite"
  disable_signature = true
  contents = jsonencode({
    sqs_prefix = "test-queue"
    env_name   = "prod"
  })
}
