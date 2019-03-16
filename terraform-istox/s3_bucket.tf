resource "aws_s3_bucket" "lb_logs" {
  bucket = "lb_logs"
  acl    = "public-read"
  policy = "${file("s3_public.json")}"
}



