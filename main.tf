# Create S3 Bucket
resource "aws_s3_bucket" "bucket" {
  bucket = "mohit-tf-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_ownership_controls" "bucket" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "bucket" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "bucket" {
  depends_on = [
    aws_s3_bucket_ownership_controls.bucket,
    aws_s3_bucket_public_access_block.bucket,
  ]

  bucket = aws_s3_bucket.bucket.id
  acl    = "public-read"
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.bucket.id
  key    = "index.html"
  source = "index.html"
  acl    = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.bucket.id
  key    = "error.html"
  source = "error.html"
  acl    = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "styles" {
  bucket = aws_s3_bucket.bucket.id
  key    = "css/styles.css"
  source = "css/styles.css"  # Ensure this matches the actual location of styles.css
  acl    = "public-read"
  content_type = "text/css"
}

resource "aws_s3_bucket_website_configuration" "website" {
    bucket = aws_s3_bucket.bucket.id
    index_document {
      suffix = "index.html"
    }
  
    error_document {
      key = "error.html"
    }
    
    depends_on = [ aws_s3_bucket_acl.example ]
  }
