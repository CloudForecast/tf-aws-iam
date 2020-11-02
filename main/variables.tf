variable "external_id" {
  description = "The external identifier to use, given to you by CloudForecast"
}

variable "cur_bucket" {
	description = "The S3 bucked used to store your Cost&Usage Report file"
}

variable "role_name" {
  description = "The name of the role CloudForecast will use"
  default     = "CloudForecastIAM"
}
