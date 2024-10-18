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

module "example_team" {
  source = "../../../modules/iam_team"

  group_name   = "mock-group"
  group_path   = "/mock/path/groups/"
  group_policy = data.aws_iam_policy_document.policy.json
  members      = ["mock_user_1", "mock_user_2"]
  create_users = true
}

data "aws_iam_policy_document" "policy" {
  statement {
    effect = "Allow"
    actions = [
      "s3:ListAllMyBuckets",
    ]
    resources = ["*"]
  }
}
