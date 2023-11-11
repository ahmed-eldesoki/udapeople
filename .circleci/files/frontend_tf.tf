# resource "aws_s3_bucket" "WebsiteBucket" {
#   bucket = "uda-people1232132"

#   tags = {
#     Name        = "My bucket"
#     Environment = "Dev"
#   }
# }

# resource "aws_s3_bucket_website_configuration" "WebsiteConf" {
#   bucket = aws_s3_bucket.WebsiteBucket.id

#   index_document {
#     suffix = "index.html"
#   }

#   error_document {
#     key = "error.html"
#   }

# }


# resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
#   bucket = aws_s3_bucket.WebsiteBucket.id
#   policy = data.aws_iam_policy_document.allow_access_from_another_account.json
# }

# data "aws_iam_policy_document" "allow_access_from_another_account" {
#   statement {
#     principals {
#       type        = "AWS"
#       identifiers = ["123456789012"]
#     }

#     actions = [
#       "s3:GetObject",
#       "s3:ListBucket",
#     ]

#     resources = [
#       aws_s3_bucket.WebsiteBucket.arn,
#       "${aws_s3_bucket.WebsiteBucket.arn}/*",
#     ]
#   }
# }