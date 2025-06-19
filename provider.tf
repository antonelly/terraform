terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.100.0"
    }
  }
}

provider "aws" {
  # Configuration options - pode comentar
  alias = "aws_west"
  region = var.region_west  # Ajuste para a sua região
}


provider "aws" {
  # Configuration options - pode comentar
  alias = "aws_east"
  region = var.region_east  # Ajuste para a sua região
}
