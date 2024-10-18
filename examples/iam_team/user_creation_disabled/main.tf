terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_iam_user" "user" {
  name = "mock_sysyem_user"
  path = "/system/"
}

module "example_team" {
  source = "../../../modules/iam_team"

  group_name = "mock-system-group"
  group_path = "/mock/path/system/groups/"
  members    = ["mock_sysyem_user"]

  depends_on = [aws_iam_user.user]
}
