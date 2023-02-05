resource "aws_route53_zone" "hosted_zone" {
  name = var.dns_name
}

resource "aws_route53_record" "site_domain" {
  zone_id = aws_route53_zone.hosted_zone.zone_id
  name    = "terraform-test.${var.dns_name}"
  type    = "A"

  alias {
    name            = aws_alb.main_ALB.dns_name
    zone_id         = aws_alb.main_ALB.zone_id
    evaluate_target_health = true
  }
}