# ------
# OUTPUT
# ------

output "weather" {
  description = "Temperatur"
  value       = "Temperaturen for ${local.result.name} er ${local.result.main.temp}ºC, og det er ${local.result.weather[0].description}."
}