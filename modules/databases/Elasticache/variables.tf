variable "clustername" { 
  type = string

}

variable "enginetype" {
  type = string
  #default = "redis"
}

variable "nodetype" {
  type = string
  #default = ["cache.t3.medium","cache.t3.small"]
}

variable "cachemodes" {
  type = number
  #default = "1"
}

variable "apply_immediately" {
  type = bool
}

variable "engineversion" {
    type = string
   # default = "6.2"
  
}

variable "port" {
    type = number
    #default = "6379"
  
}
variable "auto_minor_version_upgrade" {
  type = bool
}


variable "subnetcidr" {
  type = list(string)
  #default = "10.0.0.0/24"
}



variable "elasticcachesubnetgrp" {
       type = string
      # default = "cache-subnet"
}