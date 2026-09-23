from random import randint
import subprocess
import json

userfile = input("Enter the filename to save the data (e.g., data.json): ")

data = []
for i in range(10):
    rand = randint(1, 100)
    data.append({"name": f"servername{rand}", "cpu": rand, "memory": rand * 2, "disk": rand * 3})

with open(userfile, "w") as f:
    json.dump(data, f)

subprocess.run(["perl", "ProcessData.pl", userfile])