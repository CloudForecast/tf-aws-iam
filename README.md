# tf-aws-iam

Terraform module that creates the CloudForecast Role

## Requirements

 * `external_id`: The external identifier to use, given to you by CloudForecast
 * `cur_bucket`: The S3 bucked used to store your Cost&Usage Report file

## Usage

```hcl
module "cloudforecast" {
  source      = "git::https://github.com/CloudForecast/tf-aws-iam?ref=master"
  external_id = "99999999-8888-7777-6666-555555555555"
  cur_bucket  = "acme-billing-bucket"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| external_id | The external identifier to use, given to you by CloudForecast | string | - | yes |
| cur_bucket | The S3 bucked used to store your Cost&Usage Report file | string | - | yes |
| role_name | The name of the role CloudForecast will use | string | `CloudForecastIAM` | no |


## Support

Feel free to reach out to [hello@cloudforecast.io](mailto:hello@cloudforecast.io)  if you have any questions.

## License

Apache 2 License. See [LICENSE](LICENSE) for full details.
