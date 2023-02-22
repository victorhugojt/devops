import subprocess

def process():
    print('Deploying VMs using vagrant')

    p = subprocess.run(["vagrant", "up"])
    print(p.returncode)