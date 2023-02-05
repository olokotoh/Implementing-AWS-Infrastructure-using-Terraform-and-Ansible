# output "instance1-public_ip" {
#   value = aws_instance.instance1.public_ip
# }
# output "instance2-public_ip" {
#   value = aws_instance.instance2.public_ip
# }
# output "instance3-public_ip" {
#   value = aws_instance.instance3.public_ip
# }
output "alb_dns_name" {
  value = aws_alb.main_ALB.dns_name

}
resource "local_file" "Ip_address" {
  filename = "/home/groot/altsch/ansible/inventory"
  content  = <<EOT
${aws_instance.instance1.public_ip}
${aws_instance.instance2.public_ip}
${aws_instance.instance3.public_ip}
  EOT
}