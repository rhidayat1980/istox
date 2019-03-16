resource "aws_lb" "istox_aws-lb" {
  name               = "istox_aws-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = ["${aws_subnet.public_subnet.*.id}"]
  security_groups    = ["${aws_security_group.webservers.id}"]
  idle_timeout    = 60
  enable_deletion_protection = true

  access_logs {
    bucket  = "${aws_s3_bucket.lb_logs.bucket}"
    prefix  = "istox_lb"
    enabled = true
  }

  tags = {
    Name = "istox_aws-lb"
  }
}

resource "aws_lb_target_group" "alb_target_group" {
  name     = "alb-target-group"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.istox_vpc.id}"
  tags {
    name = "alb_target_group"
  }
  stickiness {
    type            = "lb_cookie"
    cookie_duration = 1800
    enabled         = true
  }
  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 10
    timeout             = 5
    interval            = 10
    path                = "/"
    port                = 80
  }
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = "${aws_lb.istox_aws-lb.arn}"
  port              = 80
  protocol          = "http"

  default_action {
    target_group_arn = "${aws_lb_target_group.alb_target_group.arn}"
    type             = "forward"
  }
}

