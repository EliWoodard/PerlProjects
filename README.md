# Python & Perl Projects

A collection of projects built to explore Python and Perl through data processing, API integration, web scraping, automation, and statistical analysis.

These projects demonstrate how Python and Perl can work together, using JSON for structured data exchange and subprocess execution to coordinate tasks across languages.

## Projects

### 1. Python & Perl Data Pipeline

**Technologies:** Python, Perl, JSON, Subprocess

A data pipeline that generates simulated server resource metrics and processes them into an aggregated summary.

- Generate randomized CPU, memory, and disk usage data.
- Serialize server records into JSON.
- Execute Perl scripts from Python.
- Aggregate resource usage and return results to Python.

**Key concepts:** Cross-language integration, JSON serialization, data aggregation, and process execution.

### 2. Server Log Checker

**Technologies:** Python, Perl, JSON, File I/O, Regular Expressions

A log analysis application that generates simulated server logs and analyzes system activity.

- Generate timestamped log entries with INFO, WARNING, and ERROR messages.
- Categorize and count log events.
- Identify the most common error and the server with the most errors.
- Track the first and last log entries.
- Export analysis results as JSON.

**Key concepts:** Log processing, pattern matching, data analysis, and automated reporting.

### 3. Weather API

**Technologies:** Python, Perl, REST APIs, `requests`, JSON

A weather data application that retrieves forecasts from the National Weather Service API and processes the results using Perl.

- Retrieve forecast information for multiple geographic locations.
- Resolve forecast endpoints using geographic coordinates.
- Extract temperatures, precipitation probabilities, wind speeds, and forecast descriptions.
- Process forecast periods and calculate statistical summaries.
- Export structured weather reports to CSV.

**API:** [National Weather Service API](https://www.weather.gov/documentation/services-web-api)

**Key concepts:** REST API integration, HTTP requests, nested JSON processing, data transformation, and CSV reporting.

### 4. Web Scraper

**Technologies:** Python, Perl, `requests`, BeautifulSoup, JSON

A web scraping and analysis application that collects country information from a practice website and processes the results.

- Retrieve and parse HTML content.
- Extract country names, capitals, populations, and land areas.
- Calculate statistical summaries and identify population and land-area extremes.
- Filter and sort countries using population data.
- Generate reports from the collected information.

**Website:** [Scrape This Site — Countries](https://www.scrapethissite.com/pages/simple/)

**Key concepts:** HTML parsing, web scraping, data extraction, sorting, filtering, and statistical analysis.

### 5. Erdos Straus Conjecture

Works on proving this theory wrong / right for the first 10,000 values

## Technologies & Tools

| Technology | Purpose |
|---|---|
| Python 3 | Automation, API requests, web scraping, and orchestration |
| Perl | Data processing, text analysis, and statistical reporting |
| JSON | Structured data exchange between programs |
| CSV | Tabular data export and reporting |
| Requests | HTTP requests and API integration |
| BeautifulSoup | HTML parsing and data extraction |
| Subprocess | Executing Perl scripts from Python |
| National Weather Service API | Weather forecast data |

## Getting Started

### Prerequisites

- Python 3
- Perl
- Python packages: `requests` and `beautifulsoup4`
- Perl JSON module: `JSON`

Install the Python dependencies:

```bash
python3 -m pip install requests beautifulsoup4
```

### Running the Projects

Navigate to the appropriate project directory and execute its Python entry point.

**Python & Perl Data Pipeline**
```bash
cd PythonPerl
python3 CreateData.py
```

**Server Log Checker**
```bash
cd LogAnalyzer
python3 Main.py
```

**Weather API**
```bash
python3 GetWeatherData.py
```

**Web Scraper**
```bash
cd WebScrapper
python3 Main.py
```

*Note: Entry-point filenames and directory names may vary depending on the project. Run each script from its corresponding directory and ensure its required dependencies are installed.*

## What These Projects Demonstrate

- Integrating Python and Perl applications.
- Working with external APIs and HTTP responses.
- Extracting and transforming structured and unstructured data.
- Parsing HTML and processing log files.
- Serializing and deserializing JSON.
- Automating multi-step workflows.
- Performing statistical analysis and generating reports.

The goal of this repository is to build practical programming experience through small applications that combine data collection, processing, and reporting.