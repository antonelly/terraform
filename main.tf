##### RESOURCES
resource "aws_instance" "meu_servidor" {

  # USANDO for_each NO LUGAR DE count
  #count = 3

  # META-ARGUMENT USADO NO LUGAR DO count ACIMA
  for_each = {
    fruit = "apple"
    vechicle = "car"
    continent = "Europe"
  }

  provider = aws.aws_east
  ami = var.ami
  instance_type = var.type

  subnet_id              = "subnet-0d5974f76344ba021" # Sua subnet
  vpc_security_group_ids = ["sg-04a960bf943ca0e2c"]   # Seu Security Group
  key_name               = "tutorial-key-pair"        # Seu Key Pair

  iam_instance_profile = "EC2AccessS3Role-feijo"      # Se estiver usando uma IAM Role

  tags = {

    # ESTÁTICO
    #name = "MinhaEC2viaTerraform"

    # USANDO O for_each
    name = "${each.key}: ${each.value}"
  }
}
