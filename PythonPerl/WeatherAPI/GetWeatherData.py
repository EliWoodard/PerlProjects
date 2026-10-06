import json
import requests
import subprocess

locations = [
    [45.6387, -122.6615, "Vancouver, Washington"],
    [40.7128, -74.0060, "New York City"]
]

headers = {
    "User-Agent": "MyWeatherApp/1.0"
}

forecasts = []

for location in locations:
    url = f"https://api.weather.gov/points/{location[0]},{location[1]}"
    response = requests.get(url, headers=headers)

    data = response.json()

    forecast_url = data["properties"]["forecast"]

    # Remove :80 from URL if present
    if ":80" in forecast_url:
        forecast_url = forecast_url.replace(":80", "")

    forecast_response = requests.get(forecast_url, headers=headers)

    if forecast_response.status_code == 200:
        print("Forecast data retrieved successfully.")
        forecasts.append(forecast_response.json())

        #append location value to the forecast data
        forecasts[-1]["location"] = location[2]

    else:
        print(f"Failed to retrieve forecast data. Status code: {forecast_response.status_code}")

        forecasts.append({
            "error": f"Failed to retrieve forecast data. Status code: {forecast_response.status_code}"
        })

json_file = "weather.json"

with open(json_file, "w") as f:
    json.dump(forecasts, f, indent=4)

subprocess.run(["perl", "ProcessWeatherData.pl", json_file], check=True)