resource "aws_s3_bucket" "WebsiteBucket" {
  bucket = "bucket-${var.id}"

}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.WebsiteBucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "WebsiteConf" {
  bucket = aws_s3_bucket.WebsiteBucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.WebsiteBucket.id
  policy = data.aws_iam_policy_document.public_read_access.json
}

data "aws_iam_policy_document" "public_read_access" {
  statement {
    principals {
	  type = "*"
	  identifiers = ["*"]
	}

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.WebsiteBucket.arn,
      "${aws_s3_bucket.WebsiteBucket.arn}/*",
    ]
  }
}
