Terraform module that creates the Main CloudForecast Role.

## Requirements

 * `external_id`: The external identifier to use, given to you by CloudForecast
 * `cur_bucket`: The S3 bucked used to store your Cost&Usage Report file

## Usage

```hcl
module "cloudforecast" {
  source      = "git::https://github.com/CloudForecast/tf-aws-iam//main?ref=master"
  external_id = "[REPLACE_WITH_EXTERNAL_ID]"
  cur_bucket  = "[REPLACE_WITH_CUR_BUCKET]"
}

output "main_output" {
  value = {
    "cloudforecast_instructions" = "This is the ARN needed for your CloudForecast account. Please copy this value on app.cloudforecast.io"
    "iam_arn" = module.cloudforecast.main_output
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| external_id | The external identifier to use, given to you by CloudForecast | string | - | yes |
| cur_bucket | The S3 bucked used to store your Cost&Usage Report file | string | - | yes |
| role_name | The name of the role CloudForecast will use | string | `CloudForecastIAM` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn_iam | ARN of the newly created IAM role. Please copy this value on [app.cloudforecast.io](https://app.cloudforecast.io) as part of our onboarding flow.|