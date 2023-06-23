import subprocess


def process(action):
    print("Deploying VMs using Terraform")

    p = subprocess.run(["vagrant", action])
    print(p.returncode)
