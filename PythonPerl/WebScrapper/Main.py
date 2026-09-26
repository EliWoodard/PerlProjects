import subprocess

# Run the web scrapper script
subprocess.run(["python3", "WebScrapper.py"], check=True)

# Run the data processing script
subprocess.run(["perl", "DataProcessor.pl"], check=True)