import subprocess

def process(action):
    print('Deploying VMs using vagrant')

    p = subprocess.run(["vagrant", action])
    print(p.returncode)