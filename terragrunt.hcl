remote_state {
  backend = "s3"

  config = {
    bucket  = "test-terraform-state-20221129"
    key     = "many-queues/${path_relative_to_include()}/terraform.tfstate"
    region  = "us-west-2"
    encrypt = true
    # dynamodb_table = "terraform-locks"
  }
}
