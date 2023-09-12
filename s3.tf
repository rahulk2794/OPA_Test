provider "aws" {
  region = "us-east-1" # Specify your desired AWS region
}

resource "aws_s3_bucket" "test_bucket" {
  bucket = "test_bucket" # Replace with your desired bucket name
  acl    = "private"                # Set the bucket access control list (ACL)

  # Enable versioning (optional)
  versioning {
    enabled = true
  }

  # Enable server-side encryption (optional)
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256" # Use AES256 for encryption
      }
    }
  }
}
