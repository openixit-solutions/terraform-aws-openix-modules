output "users" {
  description = "users"
  value       = module.example_team.users == {} ? "Users have been created without members." : ""
}
