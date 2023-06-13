module "vpccreation" {
  source = "../modules/network"
  vpcname = "salman-vpc"
  cidr_block = "172.29.0.0/16"
  enable_dns_hostnames = true
  #azs = {"az-1"="ap-south-1a","az-2"="ap-south-1b"}
  subnetcidrblockpublic = {"ap-south-1a"="172.29.24.0/24","ap-south-1b"="172.29.25.0/24"}
  subnetcidrblockprivate = {"ap-south-1a"="172.29.1.0/25","ap-south-1b"="172.29.2.0/25"}
  booleanvalue = true
}

module "oracledbcreation" {
  source = "../modules/databases/Oracle"
  depends_on = [ module.vpccreation ]
  allocated_storage = 20
  apply_immediately = true
  auto_minor_version_upgrade = false
  backup_retention_period = 7
  db_name = "mydb"
  dbsubnetgrpname = "mysubnetgrp"
  subnetids = module.vpccreation.privatesubnetid
  engine = "oracle-ee"
  #engine_version = "19.0.0.0.ru-2023-04.rur-2023-04.r1"
  instance_class = "db.t3.large"
  license_model = "bring-your-own-license"
  #parameter_group_name = "default.oracle-se2-19"
  username = "admin"
  password = "salmanabidh"
  publicly_accessible = false
  port = 1521
  skip_final_snapshot = true
}

module "rediscreation" {
  source = "../modules/databases/Elasticache"
  clustername = "myredis"
  enginetype = "redis"
  nodetype = "cache.t3.small"
  cachemodes = 1
  apply_immediately = true
  #azs = [ "ap-south-1a","ap-south-1b" ]
  engineversion = "6.2"
  auto_minor_version_upgrade = false
  port = 6379
  subnetcidr = module.vpccreation.privatesubnetid
  elasticcachesubnetgrp = "cache-subnet"
  
}