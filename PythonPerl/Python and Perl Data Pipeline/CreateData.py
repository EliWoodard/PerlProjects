from random import randint
import subprocess
import json

userfile = input("Enter the filename to save the data (e.g., data.json): ")

data = []
for _ in range(10):
    cpu = randint(1, 100)
    memory = randint(1, 500)
    disk = randint(1, 1000)
    data.append({"name": f"servername{_}", "cpu": cpu, "memory": memory, "disk": disk})

with open(userfile, "w") as f:
    json.dump(data, f)

subprocess.run(["perl", "ProcessData.pl", userfile], check=True)

print("\n===== Total Resource Usage =====\n");

with open("summary.json", "r") as f:
    summary = json.load(f)

print(f"Total CPU: {summary['totalCPU']}")
print(f"Total Memory: {summary['totalMemory']}")
print(f"Total Disk: {summary['totalDisk']}")