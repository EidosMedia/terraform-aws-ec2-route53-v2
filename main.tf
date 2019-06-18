locals {
    mincount = "${length(var.internal_ips["private_ip_dns"]) < length(var.internal_ips["hostname"]) ? length(var.internal_ips["private_ip_dns"]) : length(var.internal_ips["hostname"])}"
}

resource "aws_route53_record" "internal" {
  count    = "${local.mincount > 0 ? local.mincount : 0}"
  zone_id = "${var.zone_id}"
  name    = "${element(var.internal_ips["hostname"],count.index)}.${var.domain}"
  type    = "${var.type}"
  ttl     = "${var.ttl}"
  records = ["${element(var.internal_ips["private_ip_dns"],count.index)}"]
}