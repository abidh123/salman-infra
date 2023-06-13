resource "aws_elasticache_subnet_group" "elasticcachegrp" {
  name       = var.elasticcachesubnetgrp
  subnet_ids = var.subnetcidr
}


resource "aws_elasticache_cluster" "newcluster" {
   depends_on = [ aws_elasticache_subnet_group.elasticcachegrp ]
  cluster_id = var.clustername
  engine = var.enginetype
  node_type = var.nodetype
  num_cache_nodes = var.cachemodes
  parameter_group_name = "default.redis6.x"
  apply_immediately = var.apply_immediately
  engine_version = var.engineversion
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  port = var.port
  subnet_group_name = aws_elasticache_subnet_group.elasticcachegrp.name
  

  
}