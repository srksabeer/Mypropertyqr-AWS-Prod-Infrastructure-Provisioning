terraform {
  backend "s3" {
    bucket         = "prod-myproperty-terraform-remote-state"
    key            = "do-not-delete/prod-myproperty/terraform.tfstate"
    region         = "ap-south-2"
    encrypt        = true
    dynamodb_table = "Prod-myproperty-terraform-remote-state-lock"
  }
}
