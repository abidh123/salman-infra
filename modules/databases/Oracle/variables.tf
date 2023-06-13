variable "allocated_storage" {
  type = string
}

variable "apply_immediately" {
  type = bool
}
variable "auto_minor_version_upgrade" {
  type = bool
}
variable "backup_retention_period" {
  type = number
}
variable "db_name" {
  type = string
}
variable "dbsubnetgrpname" {
  type = string
}
variable "subnetids" {
  type = list(string)
}
variable "engine" {
  type = string
}
# variable "engine_version" {
#   type = string
# }
variable "instance_class" {
  type = string
}
variable "license_model" {
  type = string
}
# variable "parameter_group_name" {
#   type = string
# }
variable "username" {
  type = string
}
variable "password" {
  
}
variable "port" {
  type = number
}
variable "publicly_accessible" {
  type =  bool
}
variable "skip_final_snapshot" {
  type = bool
}