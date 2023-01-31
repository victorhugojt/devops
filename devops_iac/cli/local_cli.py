import click

from devops_iac.local_iac import provisioning_impl


@click.group(short_help="Deploy locally VM's")
def local():
    pass


@local.command(short_help="Vagrant Iac")
def provisioning():
    provisioning_impl.process()
