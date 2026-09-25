from random import randint
import subprocess
import time

logs = []

for _ in range(10):
    randType = randint(1, 3)
    messageType = ""
    messageConcern = ""
    timeStamp = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())

    if randType == 1:
        messageType = "INFO"
        messageConcern = "User login successful"
    elif randType == 2:
        messageType = "ERROR"
        messageConcern = "Database connection failed"
    else:
        messageType = "WARNING"
        messageConcern = "CPU usage above threshold"

    randServer = randint(1, 5)

    logs.append(f"{timeStamp} {messageType} server{randServer} {messageConcern}")
    waitTime = randint(1, 2)
    time.sleep(waitTime)

with open("server.log", "w") as f:
    for log in logs:
        f.write(log + "\n")

subprocess.run(["perl", "LogAnalyzer.pl"], check=True)
