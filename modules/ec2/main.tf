
resource "aws_iam_role" "ec2_role" {
  name = "ec2-s3-upload-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "s3_upload" {
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = ["s3:PutObject","s3:GetObject"]
      Resource = "${var.bucket_arn}/*"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.s3_upload.arn
}

resource "aws_iam_instance_profile" "profile" {
  role = aws_iam_role.ec2_role.name
}
