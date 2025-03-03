import sys
import subprocess

print("Please enter your BYG e-mail address: ")
email = input()

subprocess.run(["git", "config", "user.email", email])