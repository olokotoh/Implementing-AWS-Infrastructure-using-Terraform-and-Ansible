# # Create the ALB target group
# resource "aws_alb_target_group" "main_TG" {
#   name     = "main-target-group"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = aws_vpc.main_vpc.id
#   health_check {
#     enabled  = true
#     interval = 10
#     path     = "/"
#     port     = 80
#     protocol = "HTTP"
#     matcher  = "200-299"
#   }
#   tags = {
#     Name = "main-TG"
#   }
# }

# # Create the ALB listener
# resource "aws_alb_listener" "main_alb_listner" {
#   load_balancer_arn = aws_alb.main_ALB.arn
#   port              = "80"
#   protocol          = "HTTP"

#   default_action {
#     target_group_arn = aws_alb_target_group.main_TG.arn
#     type             = "forward"
#   }
# }

# # Register the instances with the target group
# resource "aws_alb_target_group_attachment" "instance1" {
#   target_group_arn = aws_alb_target_group.main_TG.arn
#   target_id        = aws_instance.instance1.id
#   port             = 80
# }

# resource "aws_alb_target_group_attachment" "instance2" {
#   target_group_arn = aws_alb_target_group.main_TG.arn
#   target_id        = aws_instance.instance2.id
#   port             = 80
# }

# resource "aws_alb_target_group_attachment" "instance3" {
#   target_group_arn = aws_alb_target_group.main_TG.arn
#   target_id        = aws_instance.instance3.id
#   port             = 80
# }