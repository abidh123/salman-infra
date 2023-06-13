resource "aws_vpc" "myvpc" {
    
  cidr_block = var.cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
}
resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id
}
resource "aws_subnet" "publicsubnets" {
  #for_each = {for i, v in keys(var.subnetcidrblockpublic) : i => { cidr = var.subnetcidrblockpublic[v] , az = v} } 
  depends_on = [ aws_vpc.myvpc ] 
  for_each = var.subnetcidrblockpublic
  availability_zone = each.key
  cidr_block = each.value
  map_public_ip_on_launch = var.booleanvalue
  vpc_id = aws_vpc.myvpc.id

}

resource "aws_subnet" "privatesubnets" {
  depends_on = [ aws_vpc.myvpc ] 
  #for_each = {for i, v in keys(var.subnetcidrblockprivate) : i => { cidr = var.subnetcidrblockprivate[v] , az = v} }
  for_each = var.subnetcidrblockprivate
  availability_zone = each.key
  cidr_block = each.value
  vpc_id = aws_vpc.myvpc.id
}

resource "aws_route_table" "myroutetable" {
    
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }
}
locals {
  subnetid = [for i ,v in aws_subnet.publicsubnets: v.id ]
}
locals {
  subnet1id = [for i ,v in aws_subnet.privatesubnets: v.id ]
}


resource "aws_route_table_association" "myroutetablepublicassociation" {
  count = length(local.subnetid) 
  subnet_id = local.subnetid[count.index]
  route_table_id = aws_route_table.myroutetable.id

}

resource "aws_route_table_association" "privateroutesassociation" {
  count = length(local.subnetid) 
  subnet_id =  local.subnet1id[count.index]
  route_table_id = aws_route_table.myroutetable.id
}

output "vpcid" {
  value = aws_vpc.myvpc.id
}

output "myigwid" {
  value = aws_internet_gateway.myigw.id
}
output "publicsubnetid" {
  value = [for i ,v in aws_subnet.publicsubnets: v.id ]
}

output "privatesubnetid" {
  value = [for i ,v in aws_subnet.privatesubnets: v.id ]
}