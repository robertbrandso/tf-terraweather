# --------
# PROVIDER
# --------
provider "http" {}


# -----------------
# FETCH COORDINATES
# -----------------

data "http" "fetch_coordinates" {
  url = "http://api.openweathermap.org/geo/1.0/direct?q=${var.location},${var.country}&limit=1&appid=${var.api_key}"

  request_headers = {
    Accept = "application/json"
  }
}

locals {
  geo = jsondecode(data.http.fetch_coordinates.response_body)
}


# -----------
# GET WEATHER
# -----------

data "http" "weather" {
  url = "https://api.openweathermap.org/data/2.5/weather?lat=${local.geo[0].*.lat[0]}&lon=${local.geo[0].*.lon[0]}&units=metric&lang=no&appid=${var.api_key}"

  request_headers = {
    Accept = "application/json"
  }
}

locals {
  result = jsondecode(data.http.weather.response_body)
}