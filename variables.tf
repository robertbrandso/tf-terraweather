# ---------
# VARIABLES
# ---------

variable "location" {
  description = "(Required) Name of the location."
  type        = string
}

variable "country" {
  description = "(Optional) Defaults to Norway."
  type        = string
  default     = "no"
}

variable "api_key" {
  description = "(Required) Get your API key at openweathermap.org/api"
  type        = string
}