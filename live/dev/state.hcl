# stage/terragrunt.hcl
remote_state {
  backend = "s3"

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }

  config = {
    bucket = "traveloka-infra-iac-us-east-1"
    region = "us-east-1"
    key    = format("%s/terraform.tfstate", path_relative_to_include())
  }
}
