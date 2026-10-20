variable "external_id" {
  description = "The external identifier to use, given to you by CloudForecast"
}

variable "role_name" {
  description = "The name of the role CloudForecast will use"
  default     = "CloudForecast-ZeroWaste"
}

variable "cloudforecast_access_role" {
  description = "The CloudForecast IAM role allowed to assume this role"
  default     = "CloudForecast-CustomerDataAccess-Pa7c9b"
}
