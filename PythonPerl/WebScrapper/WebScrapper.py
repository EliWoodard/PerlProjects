from bs4 import BeautifulSoup
import requests
import json

url = "https://www.scrapethissite.com/pages/simple/"
response = requests.get(url)
soup = BeautifulSoup(response.text, "html.parser")

# Output in json formatting the scrapped data
countries_data = []

# Find all country divs and extract the required information
countries = soup.find_all("div", class_="country")

# Loop through each country and extract the name, capital, population, and areaInSqKm
for country in countries:
    name = country.find("h3", class_="country-name").get_text()
    capital = country.find("span", class_="country-capital").get_text()
    population = country.find("span", class_="country-population").get_text()
    areaInSqKm = country.find("span", class_="country-area").get_text()

    countries_data.append({
        "name": name.strip(),
        "capital": capital.strip(),
        "population": population.strip(),
        "areaInSqKm": areaInSqKm.strip()
    })

with open("countries.json", "w") as f:
    for entry in countries_data:
        f.write(json.dumps(entry) + "\n")



