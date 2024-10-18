locals {
  tags = var.tags
  group = {
    name   = var.group_name
    path   = var.group_path
    policy = var.group_policy
  }
  users = {
    members = var.create_users ? var.members : []
    path    = var.members_path
  }
}

resource "aws_iam_group" "group" {
  name = local.group.name
  path = local.group.path
}

resource "aws_iam_user" "users" {
  for_each = toset(local.users.members)

  name = each.value
  path = local.users.path

  tags = local.tags
}

resource "aws_iam_group_membership" "membership" {
  name = "${local.group.name}-membership"

  users = var.members
  group = aws_iam_group.group.name
}

resource "aws_iam_group_policy" "group_policy" {
  count = local.group.policy == null ? 0 : 1

  name   = "${local.group.name}-policy"
  group  = aws_iam_group.group.name
  policy = local.group.policy
}
