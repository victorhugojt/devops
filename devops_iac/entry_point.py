import sys

import click

from devops_iac.cli import (
    local_cli,
)


@click.group()
def cli():
    """
    Devops Tools
    """


def main():
    #try:
    cli.add_command(local_cli.local)
    cli()
    #except:
    #    ce = click.ClickException('Error executing command')
    #    ce.show()
    #    sys.exit(ce.exit_code)


if __name__ == "__main__":
    main()
