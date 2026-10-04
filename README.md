# Python & Perl Projects

A collection of projects exploring Python and Perl, with an emphasis on combining their strengths to build data-processing applications.

These projects focus on Python's capabilities for web scraping, API requests, automation, and data generation, alongside Perl's strengths in text processing, data analysis, and structured reporting.

The projects also explore communication between Python and Perl using JSON files and subprocess execution.

## Projects

### 1. Python and Perl Data Pipeline

**Technologies:** Python, Perl, JSON, Subprocess

A data-generation and processing pipeline that simulates server resource usage.

**Python responsibilities:**

* Generate randomized server resource information.
* Create records containing server names, CPU usage, memory usage, and disk usage.
* Serialize the generated data into JSON.
* Execute the Perl processing script.
* Read the resulting JSON summary and display the totals.

**Perl responsibilities:**

* Read and decode the generated JSON data.
* Process server resource information.
* Calculate aggregate CPU, memory, and disk usage.
* Export the results into a JSON summary for Python.

**Concepts explored:**

* JSON serialization and deserialization.
* Python subprocess execution.
* Perl hash and array references.
* Cross-language data exchange.
* Data aggregation.

---

### 2. Server Log Checker

**Technologies:** Python, Perl, Subprocess, JSON, File I/O

A simulated server logging and analysis application.

Python generates sample server logs containing INFO, WARNING, and ERROR messages. Perl processes the generated logs and produces a summary of server activity.

**Python responsibilities:**

* Generate randomized server log entries.
* Assign timestamps, server identifiers, and message types.
* Simulate log generation with randomized delays.
* Execute the Perl log analyzer.
* Read and display the resulting report.

**Perl responsibilities:**

* Read and process server log files.
* Identify and categorize log entries.
* Count INFO, WARNING, and ERROR messages.
* Identify the first and last log entries.
* Determine the most common error.
* Identify the server with the most errors.
* Export the analysis results as JSON.

**Concepts explored:**

* Log processing and text analysis.
* Regular expressions and pattern matching.
* Hash-based counting and aggregation.
* Timestamp handling.
* Python and Perl process coordination.
* Automated reporting.

---

### 3. Weather API

**Technologies:** Python, Perl, Requests, National Weather Service API, JSON

A weather data collection and analysis application using the National Weather Service API.

Python retrieves forecast information using geographic coordinates, while Perl processes the returned forecast data.

**Python responsibilities:**

* Accept multiple geographic locations.
* Query the National Weather Service `/points` endpoint.
* Dynamically retrieve the appropriate forecast URL.
* Request forecast information for each location.
* Handle unsuccessful forecast requests.
* Save forecast responses into a JSON file.
* Execute the Perl processing script.

**Perl responsibilities:**

* Read and decode the forecast JSON data.
* Navigate nested JSON structures.
* Extract forecast periods and weather information.
* Process temperature, precipitation probability, wind speed, and forecast descriptions.
* Format forecast dates and display weather information.

**Concepts explored:**

* REST API integration.
* HTTP requests and response handling.
* Geographic coordinates and API endpoints.
* Nested JSON structures.
* Perl hash and array references.
* Handling optional API fields.
* Working with real-world weather data.

**API:** [National Weather Service API](https://www.weather.gov/documentation/services-web-api)

---

### 4. Web Scraper

**Technologies:** Python, Perl, Requests, BeautifulSoup, JSON, HTML Parsing

A web scraping and data analysis application that collects country information from a practice scraping website.

Python extracts country information from HTML, while Perl processes the collected information and generates statistical summaries.

**Python responsibilities:**

* Send HTTP requests to the target website.
* Parse HTML using BeautifulSoup.
* Extract country names, capitals, populations, and land areas.
* Serialize scraped information into JSON.
* Execute the Perl processing script.

**Perl responsibilities:**

* Read and decode scraped country information.
* Calculate average population and land area.
* Identify countries with the largest and smallest populations.
* Identify the countries with the largest land areas.
* Filter countries based on population thresholds.
* Sort countries by population.
* Generate statistical summaries.

**Concepts explored:**

* Web scraping and HTML parsing.
* CSS class-based element selection.
* HTTP requests.
* JSON data exchange.
* Sorting and statistical analysis.
* Processing externally collected data.

**Website:** [Scrape This Site – Countries](https://www.scrapethissite.com/pages/simple/)

---

## Technologies & Tools

| Technology                   | Usage                                                       |
| ---------------------------- | ----------------------------------------------------------- |
| Python 3                     | Data collection, automation, API requests, and web scraping |
| Perl                         | Data processing, text analysis, and statistical reporting   |
| JSON                         | Structured data exchange between languages                  |
| Requests                     | HTTP requests and API integration                           |
| BeautifulSoup                | HTML parsing and web scraping                               |
| Subprocess                   | Executing Perl scripts from Python                          |
| National Weather Service API | Weather forecast data                                       |

## Running the Projects

Each project is organized into its own directory.

### Requirements

* Python 3
* Perl
* Python packages: `requests`, `beautifulsoup4`
* Perl JSON module: `JSON`

Install the Python dependencies:

```bash
python3 -m pip install requests beautifulsoup4
```

### Execution

Navigate into the individual project directory and execute its Python entry point.

**Python and Perl Data Pipeline**

```bash
cd "Python and Perl Data Pipeline"
python3 CreateData.py
```

**Server Log Checker**

```bash
cd ServerLogChecker
python3 Main.py
```

**Weather API**

```bash
cd WeatherAPI
python3 GetWeatherData.py
```

**Web Scraper**

```bash
cd WebScrapper
python3 Main.py
```

Each project invokes its corresponding Perl processing script.

## Learning Objectives

These projects were developed to explore practical applications of Python and Perl while learning how multiple programming languages can work together.

Key areas of focus include:

* Integrating programs written in different programming languages.
* Retrieving and processing external data.
* Working with REST APIs and web scraping.
* Serializing and deserializing JSON.
* Automating scripts and processes.
* Processing structured and unstructured data.
* Performing statistical analysis and generating reports.

The overall goal is to develop practical experience with Python, Perl, and cross-language software integration.
