# ------
# OUTPUT
# ------

output "weather_report" {
  description = "Værmelding"
  value       = "Temperaturen for ${local.result.name} er ${local.result.main.temp}ºC."
}