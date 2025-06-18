provider "aws" {
  region = var.region  # Ajuste para a sua região
}

###### INPUT VARIABLES
variable "region" {
  default = "us-east-2" # Ohio
  description = "AWS Region que eu escolho"
}

variable "ami" {
  default = "ami-0d1b5a8c13042c939"
  description = "Amazon Machine Image ID for Ubuntu 22.04-LTS"
}

variable "type" {
  default = "t2.micro"
  description = "Tamanho da VM"
}


###### RESOURCES
resource "aws_instance" "meu_servidor" {
  ami = "ami-0d1b5a8c13042c939" # ID da sua Amazon Machine Image
  instance_type = "t2.micro"

  subnet_id              = "subnet-0d5974f76344ba021" # Sua subnet
  vpc_security_group_ids = ["sg-04a960bf943ca0e2c"]   # Seu Security Group
  key_name               = "tutorial-key-pair"        # Seu Key Pair

  iam_instance_profile = "EC2AccessS3Role-feijo"      # Se estiver usando uma IAM Role

  tags = {
    name = "MinhaEC2viaTerraform"
  }
}


####### OUTPUT VARIABLES
output "instance_id" {
  value = aws_instance.meu_servidor.id
}

output "public_ip" {
  value = aws_instance.meu_servidor.public_ip
}

###### LOCAL VARIABLES
