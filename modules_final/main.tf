provider "aws" {
  region = "us-east-2"
}

module "vpc" {
  source = "./vpc"
  vpc_name = "vpc_module1"
  vpc_cidr = "19.82.0.0/16"
  az = "us-east-2a"
  subnet_cidr = "19.82.1.0/24"
  ec2_private_ip = ["19.82.1.82"]
  subnet_name = "Subnet from module"
}

module "ec2" {
  source = "./ec2"
  ec2ami = "ami-0fb653ca2d3203ac1"
  ec2type = "t2.micro"
  ec2iface = module.vpc.ec2_network_interface
  ec2name = "EC2 from module"
}