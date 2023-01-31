import sys

import click

from devops_iac.cli import (
    local_cli,
)

DEFAULT_LOG_LEVEL = "INFO"


@click.group()
@click.option("-v", "--verbose", default=DEFAULT_LOG_LEVEL)
def cli(verbose=DEFAULT_LOG_LEVEL):
    """
    Devops Tools
    """


def main():
    try:
        cli.add_command(local_cli.local)
        cli()
    except:
        ce = click.ClickException('Error executing command')
        ce.show()
        sys.exit(ce.exit_code)


if __name__ == "__main__":
    main()
