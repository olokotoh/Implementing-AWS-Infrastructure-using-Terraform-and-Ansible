# # Create a VPC
# resource "aws_vpc" "main_vpc" {
#   cidr_block = "10.1.0.0/16"
# }

# # Create 3 subnets
# resource "aws_subnet" "subnet1" {
#   vpc_id            = aws_vpc.main_vpc.id
#   cidr_block        = "10.1.0.0/24"
#   availability_zone = "us-east-1a"
#   tags = {
#     Name = "subnet1"
#   }
# }

# resource "aws_subnet" "subnet2" {
#   vpc_id            = aws_vpc.main_vpc.id
#   cidr_block        = "10.1.1.0/24"
#   availability_zone = "us-east-1b"

#   tags = {
#     Name = "subnet2"
#   }
# }

# resource "aws_subnet" "subnet3" {
#   vpc_id            = aws_vpc.main_vpc.id
#   cidr_block        = "10.1.2.0/24"
#   availability_zone = "us-east-1c"

#   tags = {
#     Name = "subnet3"
#   }
# }

# # Create an Internet Gateway
# resource "aws_internet_gateway" "main_IGW" {
#   vpc_id = aws_vpc.main_vpc.id
# }

# # Create a Route Table
# resource "aws_route_table" "main_RT" {
#   vpc_id = aws_vpc.main_vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.main_IGW.id
#   }
# }

# #Associate the Route Table with the subnets
# resource "aws_route_table_association" "subnet1" {
#   subnet_id      = aws_subnet.subnet1.id
#   route_table_id = aws_route_table.main_RT.id
# }

# resource "aws_route_table_association" "subnet2" {
#   subnet_id      = aws_subnet.subnet2.id
#   route_table_id = aws_route_table.main_RT.id
# }

# resource "aws_route_table_association" "subnet3" {
#   subnet_id      = aws_subnet.subnet3.id
#   route_table_id = aws_route_table.main_RT.id
# }




# # Create the ALB
# resource "aws_alb" "main_ALB" {
#   name               = "main-alb"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.alb_SG.id]
#   subnets            = [aws_subnet.subnet1.id, aws_subnet.subnet2.id, aws_subnet.subnet3.id]
# }






