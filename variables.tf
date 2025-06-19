
###### INPUT VARIABLES
variable "region_east" {
  default = "us-east-2" # Ohio
  description = "AWS Region que eu escolhi - Ohio"
}

variable "region_west" {
  default = "us-west-1" # N. California
  description = "AWS Region que eu escolhi - N. California"
}

variable "ami" {
  default = "ami-0d1b5a8c13042c939"
  description = "Amazon Machine Image ID for 24.04.2 LTS"
}

variable "type" {
  default = "t2.micro"
  description = "Tamanho da VM"
}

####### OUTPUT VARIABLES
output "instance_id" {
  //value = aws_instance.meu_servidor[*].id
  value = [for b in aws_instance.meu_servidor : b.id]
}

output "public_ip" {
  //value = aws_instance.meu_servidor[*].public_ip
  value = [for b in aws_instance.meu_servidor : b.id]
}

# UMA ABAIXO ESTA UMA FORMA DE FAZER DIFERENTE DA FORMA ACIMA
#output "instance_id" {
#  value = aws_instance.meu_servidor[*].id
#}
#
#output "public_ip" {
#  value = aws_instance.meu_servidor[*].public_ip
#}

# Esse [*] -> se chama splat


###### LOCAL VARIABLES
