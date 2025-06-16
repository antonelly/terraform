provider "aws" {
  region = "us-east-2"  # Ajuste para a sua região
}

resource "aws_instance" "meu_servidor" {
  ami           = "ami-0d1b5a8c13042c939"   # ID da sua AMI
  instance_type = "t2.micro"

  subnet_id              = "subnet-0d5974f76344ba021" # Sua subnet
  vpc_security_group_ids = ["sg-04a960bf943ca0e2c"]   # Seu Security Group
  key_name               = "tutorial-key-pair"        # Seu Key Pair

  iam_instance_profile = "EC2AccessS3Role-feijo"            # Se estiver usando uma IAM Role

  tags = {
    Name = "MinhaEC2viaTerraform"
  }
}

