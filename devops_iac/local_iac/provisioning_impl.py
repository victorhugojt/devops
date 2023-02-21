import subprocess

def process():
    print('Deploying VM using vagrant')

    # vagrantfile = '/vm_config.vagrantfile'

    p = subprocess.run(["python", "--version"])
    print(p.returncode)

    