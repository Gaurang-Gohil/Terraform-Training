terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  alias  = "east"
  region = "us-east-1"
}

provider "aws" {
  alias  = "west"
  region = "us-west-2"
}

resource "aws_instance" "east" {
  count         = 3
  provider      = aws.east
  ami           = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
  instance_type = "t2.micro"
}

resource "aws_instance" "west" {
  count         = 2
  provider      = aws.west
  ami           = "ami-0c2d3e23f757b5d84" # Ubuntu 20.04 LTS // us-west-2
  instance_type = "t2.micro"
}
