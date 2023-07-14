
resource "aws_s3_bucket_policy" "aliaksxssv-secure-bucket-policy" {
    bucket = aws_s3_bucket.aliaksxssv-secure-bucket.id
    policy = jsonencode({
        Version = "2012-10-17"
        Id      = "BUCKET-POLICY"
        Statement = [
            {
                Sid       = "EnforceProtoVer"
                Effect    = "Deny"
                Principal = "*"
                Action    = "s3:*"
                Resource = [
                    "${aws_s3_bucket.aliaksxssv-secure-bucket.arn}/*",
                    "${aws_s3_bucket.aliaksxssv-secure-bucket.arn}",
                ]
                Condition = {
                    NumericLessThan = {
                        "s3:TlsVersion": 1.2
                    }
                }
            }
        ]
    })
}