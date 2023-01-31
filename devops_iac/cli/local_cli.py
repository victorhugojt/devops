import click

from devops_iac.local_iac import provisioning


@click.group(short_help="Semaphore for performance framework")
def local():
    pass


@local.command(short_help="Lock load injections")
def provissioning(scenario_file, database_config, environment_file):
    provisioning.process(scenario_file, database_config, environment_file)
