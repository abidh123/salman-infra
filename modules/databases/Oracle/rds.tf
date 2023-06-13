resource "aws_db_subnet_group" "mydbsubnetgroup" {
  name = var.dbsubnetgrpname
  
  subnet_ids =  var.subnetids
}
resource "aws_db_instance" "mydb" {
   
  allocated_storage = var.allocated_storage
  apply_immediately = var.apply_immediately
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  backup_retention_period = var.backup_retention_period
  db_name = var.db_name
  db_subnet_group_name = var.dbsubnetgrpname
  engine = var.engine
  #engine_version = var.engine_version
  instance_class = var.instance_class
  license_model = var.license_model
  #parameter_group_name = var.parameter_group_name
  username = var.username
  password = var.password
  port = var.port
  publicly_accessible = var.publicly_accessible
  skip_final_snapshot = var.skip_final_snapshot
  depends_on = [ aws_db_subnet_group.mydbsubnetgroup ]
}
