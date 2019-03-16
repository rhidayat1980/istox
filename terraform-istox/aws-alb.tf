resource "aws_lb" "istox_aws-lb" {
  name               = "istox_aws-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.webservers.id}"]
  subnets            = ["${aws_subnet.public.*.id}"]

  enable_deletion_protection = true

  access_logs {
    bucket  = "${aws_s3_bucket.lb_logs.bucket}"
    prefix  = "istox_lb"
    enabled = true
  }

  tags = {
    Environment = "production"
  }
}
