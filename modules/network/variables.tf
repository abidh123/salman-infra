variable "vpcname" {
  type = string
}
variable "cidr_block" {
    type = string
}
variable "enable_dns_hostnames" {
  type = bool
}
variable "azs" {
  type = map(string)
  default = {

  }
}
variable "subnetcidrblockpublic" {
  type = map(string)
  default =  {"ap-south-1a"="172.29.24.0/24","ap-south-1b"="172.29.25.0/24"}
  

  
}

variable "subnetcidrblockprivate" {
  type = map(string)
  default = {

  }
}

variable "booleanvalue" {
  type = bool
}