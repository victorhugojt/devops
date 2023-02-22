import click

from devops_iac.local_iac import provisioning_impl


@click.group(short_help="Deploy locally VM's")
def local():
    pass


@local.command(short_help="Vagrant Iac")
@click.option("-a", "--action", required=True, type=click.STRING)
def provisioning(action):
    provisioning_impl.process(action)
