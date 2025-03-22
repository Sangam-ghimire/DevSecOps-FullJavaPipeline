terraform {
  backend "s3" {
    bucket         = "prod-terraform-state-bucket-latest"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "prod-terraform-locks-latest"
    profile        = "treeleafai" 
  }
}
