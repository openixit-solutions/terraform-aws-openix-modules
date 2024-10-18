variable "group_name" {
  description = "(Required) The group's name. The name must consist of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: =,.@-_.. Group names are not distinguished by case."
  type        = string
}

variable "members" {
  description = "(Required) IAM user members list."
  type        = list(string)
}

variable "group_path" {
  description = "(Optional, default '/') Path in which to create the group."
  type        = string
  default     = "/"
}

variable "group_policy" {
  description = "(Optional default null) Team group policy to attachment."
  type        = any
  default     = null
}

variable "members_path" {
  description = " (Optional, default '/') Path in which to create the user."
  type        = string
  default     = "/"
}

variable "create_users" {
  description = "(Optional, default false) Enable user creation."
  type        = bool
  default     = false
}

variable "tags" {
  description = "(Optional, default { Terraform = true }) Key-value map of tags for the IAM Team."
  type        = any
  default     = { Terraform = true }
}
