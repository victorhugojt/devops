import click

from devops_iac.local_iac import provisioning


@click.group(short_help="Deploy locally VM's")
def local():
    pass


@local.command(short_help="Vagrant Iac")
def provissioning(scenario_file, database_config, environment_file):
    provisioning.process(scenario_file, database_config, environment_file)
