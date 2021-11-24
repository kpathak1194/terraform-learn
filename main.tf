provider "aws" {
    region = "ap-south-1"
    
  }

  variable "cidr_block" {
    description = "cidr blocks for vpc and subnets"
    type = list(string)
  }

variable "avail_zone" {
  
}

resource "aws_vpc" "developement_vpc" {
    cidr_block = "var.cidr.block[0]"
    tags = {
      Name: "developement"
    }      
  }

resource "aws_subnet" "dev-subnet" {
      vpc_id = aws_vpc.developement_vpc.id
      cidr_block =  var.cidr_block[1]
      availability_zone = var.avail_zone
      tags = {
        Name: "subnet-dev"
      } 
}

output "dev-vpc-id" {
  value = aws_vpc.developement_vpc.id 
}
output "dev-subnet-id" {
  value = aws_subnet.dev-subnet.id
}  
