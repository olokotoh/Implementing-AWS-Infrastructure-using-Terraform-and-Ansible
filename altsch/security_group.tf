# Create a security group for the ALB
resource "aws_security_group" "alb_SG" {
  name        = "alb_SG"
  description = "security group for alb"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    description = "allow https from anywhere"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    description = "allow http  from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# Create a security group for the instances
resource "aws_security_group" "main_vmSG" {
  name        = "main_vmSG "
  description = "main security group"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description     = "alllow anyone on port 8080"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_SG.id]

  }

  ingress {
    description     = "alllow anyone on port 8080"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_SG.id]

  }



  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
