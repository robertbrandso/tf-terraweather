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
  type    = string
}