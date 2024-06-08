terraform {
  backend "s3" {
    bucket         = "prod-mypropertyqr-terraform-remote-state"
    key            = "do-not-delete/prod-mypropertyqr/terraform.tfstate"
    region         = "ap-south-2"
    encrypt        = true
    dynamodb_table = "prod-myproperty-terraform-remote-state-lock"
  }
}
