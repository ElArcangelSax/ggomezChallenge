#
# backend
#
terraform {
  backend "s3" {
    bucket         = "terraform-state-data"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-dev"
  }
}
#