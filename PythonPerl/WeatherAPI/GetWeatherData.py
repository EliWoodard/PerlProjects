import requests

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

    print(forecast_url)

    # remove :80 from url if present
    if ":80" in forecast_url:
        forecast_url = forecast_url.replace(":80", "")

    forecast_response = requests.get(forecast_url, headers=headers)

    print(forecast_response.status_code)
    print(forecast_response.json())