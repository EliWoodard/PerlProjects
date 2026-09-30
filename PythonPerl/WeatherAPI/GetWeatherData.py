import json
import requests
import subprocess

locations = [
    (39.7456, -97.0892),
    # add another coordinate here
]

headers = {
    "User-Agent": "MyWeatherApp/1.0"
}

for location in locations:
    url = f"https://api.weather.gov/points/{location[0]},{location[1]}"
    response = requests.get(url, headers=headers)

    data = response.json()

    forecast_url = data["properties"]["forecast"]

    # remove :80 from url if present
    if ":80" in forecast_url:
        forecast_url = forecast_url.replace(":80", "")

    forecast_response = requests.get(forecast_url, headers=headers)

    if forecast_response.status_code == 200:
        print("Forecast data retrieved successfully.")
        with open("countries.json", "w") as f:
            f.write(json.dumps(forecast_response.json()) + "\n")
    else:
        print(f"Failed to retrieve forecast data. Status code: {forecast_response.status_code}")

    subprocess.run(["perl", "ProcessWeatherData.pl"], check=True)