data "aws_ssm_parameter" "linuxAmi" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

#create key pair for logging into ec2
resource "aws_key_pair" "aslim_keypair" {
  key_name   = "aslim_keypiar"
  public_key = file("~/.ssh/id_rsa.pub")
}



# Create the 3 instances
resource "aws_instance" "instance1" {
  ami                         = data.aws_ssm_parameter.linuxAmi.value
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.subnet1.id
  vpc_security_group_ids      = [aws_security_group.main_vmSG.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.aslim_keypair.key_name

  tags = {
    Name = "instance1"
  }
  depends_on = [aws_route_table_association.subnet1]




}

resource "aws_instance" "instance2" {
  ami                         = data.aws_ssm_parameter.linuxAmi.value
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.subnet2.id
  vpc_security_group_ids      = [aws_security_group.main_vmSG.id]
  key_name                    = aws_key_pair.aslim_keypair.key_name
  associate_public_ip_address = true

  tags = {
    Name = "instance2"
  }
  depends_on = [aws_route_table_association.subnet2]



}
resource "aws_instance" "instance3" {
  ami                         = data.aws_ssm_parameter.linuxAmi.value
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.subnet3.id
  vpc_security_group_ids      = [aws_security_group.main_vmSG.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.aslim_keypair.key_name


  tags = {
    Name = "instance3"
  }
  depends_on = [aws_route_table_association.subnet3]

 
}

