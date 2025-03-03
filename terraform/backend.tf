terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket-142"
    key            = "terraform/state/infra.tfstate"
    region         = "us-east-1"
  }
}
