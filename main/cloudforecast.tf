##################################
# Definition of Cloudforecast role
##################################

data "aws_iam_policy_document" "cloudforecast-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::656227328603:root"]
    }
    condition {
      test     = "StringEquals"
      values   = [var.external_id]
      variable = "sts:ExternalId"
    }
  }
}

resource "aws_iam_role" "cloudforecast" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.cloudforecast-role-policy.json
}

######################################################
# Definition of policy on CUR for Cloudforecast role
######################################################

data "aws_iam_policy_document" "cloudforecast-cur-policy-doc" {
  statement {
    actions = [
      "s3:Get*",
      "s3:List*"
    ]
    resources = [
      "arn:aws:s3:::${var.cur_bucket}",
      "arn:aws:s3:::${var.cur_bucket}/*"
    ]
  }
}

resource "aws_iam_policy" "cloudforecast-cur-policy" {
  name        = "CloudforecastCurPolicy"
  description = "Access for Cloudforecast service on CUR S3 bucket"
  policy = data.aws_iam_policy_document.cloudforecast-cur-policy-doc.json
}

resource "aws_iam_policy_attachment" "cloudforecast-cur-policy-attach" {
  name       = "CloudforecastCurRolePolicy"
  roles      = [aws_iam_role.cloudforecast.name]
  policy_arn = aws_iam_policy.cloudforecast-cur-policy.arn
}

###############################################################
# Definition of policy on Cost explorer for Cloudforecast role
###############################################################

data "aws_iam_policy_document" "cloudforecast-explorer-policy-doc" {
  statement {
    actions = [
      "ce:*"
    ]
    resources = [
      "*"
    ]
  }
}

resource "aws_iam_policy" "cloudforecast-explorer-policy" {
  name        = "CloudforecastExplorerPolicy"
  description = "Access for Cloudforecast service on Cost explorer"
  policy = data.aws_iam_policy_document.cloudforecast-explorer-policy-doc.json
}

resource "aws_iam_policy_attachment" "cloudforecast-explorer-policy-attach" {
  name       = "CloudforecastExplorerRolePolicy"
  roles      = [aws_iam_role.cloudforecast.name]
  policy_arn = aws_iam_policy.cloudforecast-explorer-policy.arn
}

###############################################################
# Definition of policy on Organization for Cloudforecast role
###############################################################

data "aws_iam_policy_document" "cloudforecast-organization-policy-doc" {
  statement {
    actions = [
      "organizations:ListAccounts"
    ]
    resources = [
      "*"
    ]
  }
}

resource "aws_iam_policy" "cloudforecast-organization-policy" {
  name        = "CloudforecastOrganizationPolicy"
  description = "Access for Cloudforecast service on Organization"
  policy = data.aws_iam_policy_document.cloudforecast-organization-policy-doc.json
}

resource "aws_iam_policy_attachment" "cloudforecast-organization-policy-attach" {
  name       = "CloudforecastOrganizationRolePolicy"
  roles      = [aws_iam_role.cloudforecast.name]
  policy_arn = aws_iam_policy.cloudforecast-organization-policy.arn
}

###############################################################
# Definition of policy on Savings Plans for Cloudforecast role
###############################################################

data "aws_iam_policy_document" "cloudforecast-savings-policy-doc" {
  statement {
    actions = [
      "savingsplans:List*",
      "savingsplans:Describe*"
    ]
    resources = [
      "*"
    ]
  }
}

resource "aws_iam_policy" "cloudforecast-savings-policy" {
  name        = "CloudforecastSavingsPlansPolicy"
  description = "Access for Cloudforecast service on Savings Plans"
  policy = data.aws_iam_policy_document.cloudforecast-savings-policy-doc.json
}

resource "aws_iam_policy_attachment" "cloudforecast-savings-policy-attach" {
  name       = "CloudforecastSavingsPlansRolePolicy"
  roles      = [aws_iam_role.cloudforecast.name]
  policy_arn = aws_iam_policy.cloudforecast-savings-policy.arn
}
