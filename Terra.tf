provider "aws" {
  region = "us-east-1"
  access_key = "AKIA23GICXSIKSWX3QNA"
  secret_key = "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"
}

resource "aws_vpc" "Bam" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Bam"
  }
}

resource "aws_internet_gateway" "Bam-igw" {
  vpc_id = aws_vpc.Bam.id

  tags = {
    Name = "Bam-igw"
  }
}

resource "aws_vpc" "Bam" {
  cidr_block = "10.1.0.0/16"
}

resource "aws_route_table" "Bam-RT" {
  vpc_id = aws_vpc.Bam.id

  # since this is exactly the route AWS will create, the route will be adopted
  route {
    cidr_block = "10.1.0.0/16"
    gateway_id = "local"
  }
}