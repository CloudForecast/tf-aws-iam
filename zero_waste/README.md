Terraform module that creates the ZeroWaste CloudForecast Role.

## Requirements

 * `external_id`: The external identifier to use, given to you by CloudForecast

## Usage

```hcl
module "cloudforecast" {
  source      = "git::https://github.com/CloudForecast/tf-aws-iam//zero_waste?ref=master"
  external_id = "[REPLACE_WITH_EXTERNAL_ID]"
}

output "main_output" {
  value = {
    "cloudforecast_instructions" = "This is the Name needed for your CloudForecast account. Please copy this value on app.cloudforecast.io"
    "iam_arn" = module.cloudforecast.main_output
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| external_id | The external identifier to use, given to you by CloudForecast | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| role_name | Role of the newly created IAM role. Please copy this value on [app.cloudforecast.io](https://app.cloudforecast.io). This name must be the same accross all your accounts|