terraform {
  backend "s3" {
    bucket         = "dev-terraform-state-bucket-latest"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "dev-terraform-locks-latest"
    profile        = "treeleafai" 

  }
}
