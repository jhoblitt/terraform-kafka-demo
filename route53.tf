resource "aws_route53_record" "kafka_lb0" {
  count           = "${var.dns_enable ? 1 : 0}"
  zone_id         = "${var.aws_zone_id}"
  allow_overwrite = "${var.dns_overwrite}"

  name    = "${local.dns_prefix}${var.deploy_name}0.${var.domain_name}"
  type    = "A"
  ttl     = "60"
  records = ["${local.confluent_lb0_ip}"]
}

resource "aws_route53_record" "kafka_lb1" {
  count           = "${var.dns_enable ? 1 : 0}"
  zone_id         = "${var.aws_zone_id}"
  allow_overwrite = "${var.dns_overwrite}"

  name    = "${local.dns_prefix}${var.deploy_name}1.${var.domain_name}"
  type    = "A"
  ttl     = "60"
  records = ["${local.confluent_lb1_ip}"]
}

resource "aws_route53_record" "kafka_lb2" {
  count           = "${var.dns_enable ? 1 : 0}"
  zone_id         = "${var.aws_zone_id}"
  allow_overwrite = "${var.dns_overwrite}"

  name    = "${local.dns_prefix}${var.deploy_name}2.${var.domain_name}"
  type    = "A"
  ttl     = "60"
  records = ["${local.confluent_lb2_ip}"]
}

resource "aws_route53_record" "grafana" {
  count           = "${var.dns_enable ? 1 : 0}"
  zone_id         = "${var.aws_zone_id}"
  allow_overwrite = "${var.dns_overwrite}"

  name    = "${local.grafana_fqdn}"
  type    = "A"
  ttl     = "60"
  records = ["${local.nginx_ingress_ip}"]
}

resource "aws_route53_record" "prometheus" {
  count           = "${var.dns_enable ? 1 : 0}"
  zone_id         = "${var.aws_zone_id}"
  allow_overwrite = "${var.dns_overwrite}"

  name    = "${local.prometheus_fqdn}"
  type    = "A"
  ttl     = "60"
  records = ["${local.nginx_ingress_ip}"]
}

resource "aws_route53_record" "influxdb" {
  count           = "${var.dns_enable ? 1 : 0}"
  zone_id         = "${var.aws_zone_id}"
  allow_overwrite = "${var.dns_overwrite}"

  name    = "${local.influxdb_fqdn}"
  type    = "A"
  ttl     = "60"
  records = ["${local.nginx_ingress_ip}"]
}

resource "aws_route53_record" "registry" {
  count           = "${var.dns_enable ? 1 : 0}"
  zone_id         = "${var.aws_zone_id}"
  allow_overwrite = "${var.dns_overwrite}"

  name    = "${local.registry_fqdn}"
  type    = "A"
  ttl     = "60"
  records = ["${local.nginx_ingress_ip}"]
}
