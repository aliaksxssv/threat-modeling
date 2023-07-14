resource "aws_s3_bucket" "aliaksxssv-log-bucket" {
  bucket = "aliaksxssv-log-bucket"
}

resource "aws_s3_bucket_acl" "aliaksxssv-log-bucket-acl" {
  bucket = aws_s3_bucket.aliaksxssv-log-bucket.id
  acl    = "log-delivery-write"
}

resource "aws_s3_bucket_logging" "aliaksxssv-secure-bucket-logging" {
  bucket = aws_s3_bucket.aliaksxssv-secure-bucket.id

  target_bucket = aws_s3_bucket.aliaksxssv-log-bucket.id
  target_prefix = "log/"
}