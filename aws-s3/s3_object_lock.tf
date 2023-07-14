resource "aws_s3_bucket" "aliaksxssv-secure-bucket" {
  bucket = "aliaksxssv-secure-bucket"

  object_lock_enabled = true
}

resource "aws_s3_bucket_versioning" "versioning_aliaksxssv-secure-bucket" {
  bucket = aws_s3_bucket.aliaksxssv-secure-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_object_lock_configuration" "object-lock-aliaksxssv-secure-bucket" {
  bucket = aws_s3_bucket.aliaksxssv-secure-bucket.id

  rule {
    default_retention {
      mode = "COMPLIANCE"
      days = 1
    }
  }
}
