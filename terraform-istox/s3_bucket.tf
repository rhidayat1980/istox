resource "aws_s3_bucket" "lb_logs" {
  bucket = "lb_logs"
  acl    = "private"
}

resource "aws_s3_bucket" "istox-testing" {
  bucket = "istox-testing"
  acl    = "public-read"
}


