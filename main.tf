/*
# Create Prod myproperty Backend-S3.
module "Backend-S3" {
  source = "./Modules/Backend-S3"
}


# Create Prod myproperty DYNAMODB..
module "DYNAMODB" {
  source = "./Modules/DYNAMODB"
}

*/


# Create Prod myproperty VPC..
module "VPC" {
  source = "./Modules/VPC"
  vpc_id = module.VPC.vpc_id
  internet_gateway_id = module.VPC.vpc_id
  public-subnet-1_id  = module.VPC.vpc_id
  public-subnet-2_id  = module.VPC.vpc_id
  public-subnet-3_id  = module.VPC.vpc_id
  public-route-table-1_id = module.VPC.vpc_id
  public-subnet-1-route-table-association_id = module.VPC.vpc_id
  private-subnet-1_id  = module.VPC.vpc_id
  private-subnet-2_id  = module.VPC.vpc_id
  private-subnet-3_id  = module.VPC.vpc_id
  private-route-table-1_id = module.VPC.vpc_id
  private-subnet-1-route-table-association_id = module.VPC.vpc_id
  }


# Create Prod myproperty SECURITY-GROUP..
module "SECURITY-GROUP" {
  source = "./Modules/SECURITY-GROUP"
  vpc_id = module.VPC.vpc_id
  }


# Create Prod myproperty EC2.
module "EC2" {
  source = "./Modules/EC2"

  vpc_id = module.VPC.vpc_id
  security_group_id = module.SECURITY-GROUP.security_group_id
  public-subnet-1_id = module.VPC.public-subnet-1_id
  public-subnet-2_id = module.VPC.public-subnet-2_id
  }

