terraform {
  required_providers {
    http = {
      source  = "hashicorp/http"
      version = "3.0.1"
    }
  }
}

provider "http" {
  # Configuration options
}

variable "zipcode" {
  type    = string
  default = "90210"
  validation {
    condition     = length(var.zipcode) == 5 && can(tonumber(var.zipcode))
    error_message = "The zip code isn't a valid USA zip code."
  }
}

variable "api_key" {
  type = string
}

data "http" "weather" {
  url = "https://api.openweathermap.org/data/2.5/weather?zip=${var.zipcode}&units=imperial&appid=${var.api_key}"

  # Optional request headers
  request_headers = {
    Accept = "application/json"
  }

  lifecycle {
    postcondition {
      condition     = self.status_code != "200"
      error_message = "Error getting weather for ${var.zipcode}."
    }
  }
}

locals {
  result = jsondecode(data.http.weather.response_body)
}

output "report" {
  value = "The temp in ${local.result.name} is ${local.result.main.temp}F and ${local.result.weather.0.main}."
}
