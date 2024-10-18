output "group_arn" {
  description = "The ARN assigned by AWS for this team group."
  value       = aws_iam_group.group.arn
}

output "group_id" {
  description = "The team group's ID."
  value       = aws_iam_group.group.id
}

output "group_name" {
  description = "The team group's name."
  value       = aws_iam_group.group.name
}

output "users" {
  description = "Displays the list of users. When create_users is disabled, the value is {}."
  value       = aws_iam_user.users
}
