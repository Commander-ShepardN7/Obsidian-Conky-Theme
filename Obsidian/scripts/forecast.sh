#!/bin/bash
#Commander-ShepardN7
# Weather Forecast Script v1.1
# Retrieves and saves tomorrow's forecast (min and max temp) from OpenWeatherMap 
# it also fetches main icon (at dawn) to display it on conky as "Tomorrow's" forecast

# Config
city_id= #replace with your's
api_key= #replace with your's
unit=metric
lang=en

# Output file
output_file="$HOME/.cache/weather_forecast.json"

# API endpoint (5-day forecast in 3-hour intervals)
url="https://api.openweathermap.org/data/2.5/forecast?id=${city_id}&appid=${api_key}&units=${unit}&lang=${lang}"

# Download JSON
curl -s "$url" -o "$output_file"

# Extract tomorrow's date
tomorrow=$(date -d "+1 day" +%Y-%m-%d)

# Get temps for tomorrow using jq (you must have jq installed)
jq --arg date "$tomorrow" '
  .list
  | map(select(.dt_txt | startswith($date)))
  | {
      min: (map(.main.temp_min) | min),
      max: (map(.main.temp_max) | max),
      avg: (map(.main.temp) | add / length | floor),
      icon: (
        map(select(.dt_txt | endswith("12:00:00")))[0].weather[0].icon
      )
    }
' "$output_file" > "$HOME/.cache/weather_tomorrow.json"
exit

