import subprocess
import json

print("Running the Python script to create data and process it(may take 20 seconds)...")

# Run the Python script to create data and process it
subprocess.run(["python3", "CreateData.py"], check=True)

# Read the server.log file and print the total resource usage
with open("summary.json", "r") as f:
    summary = json.load(f)

print("===== SERVER LOG REPORT =====")
print()
print(f"Total Entries: {summary['total_entries']}")
print()
print(f"INFO:     {summary['info_count']}")
print(f"WARNING:  {summary['warning_count']}")
print(f"ERROR:    {summary['error_count']}")
print()
print(f"First Entry: {summary['first_entry']}")
print(f"Last Entry:  {summary['last_entry']}")
print()
print(f"Most Common Error: {summary['most_common_error']}")
print(f"Server with Most Errors: {summary['server_with_most_errors']}")
