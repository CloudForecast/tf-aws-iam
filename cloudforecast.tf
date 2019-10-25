resource "aws_iam_role" "cloudforecast" {
  name               = "${var.role_name}"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "AWS": "arn:aws:iam::656227328603:root"
      },
      "Effect": "Allow",
      "Condition": {
        "StringEquals": {
          "sts:ExternalId": "${var.external_id}"
        }
      }
    }
  ]
} 
EOF
}

resource "aws_iam_role_policy" "cloudforecast_cur_policy" {
  name = "CloudForecast-CUR-Policy"
  role = "${aws_iam_role.cloudforecast.id}"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "CostReadCUR",
      "Action": [
        "s3:Get*",
        "s3:List*"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::${var.cur_bucket}",
        "arn:aws:s3:::${var.cur_bucket}/*"
      ]
    }
  ]
} 
EOF
}

resource "aws_iam_role_policy" "costexplorer_policy" {
  name = "CostExplorerPolicy"
  role = "${aws_iam_role.cloudforecast.id}"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [{
    "Sid": "CostExplorerAccess",
    "Action": [
      "ce:*"
    ],
    "Effect": "Allow",
    "Resource": "*"
  }]
} 
EOF
}

resource "aws_iam_role_policy" "organization_policy" {
  name = "OrganizationPolicy"
  role = "${aws_iam_role.cloudforecast.id}"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [{
    "Sid": "OrganizationListAccess",
    "Action": [
      "organizations:ListAccounts"
    ],
    "Effect": "Allow",
    "Resource": "*"
  }]
}
EOF
}