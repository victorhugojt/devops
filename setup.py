#!/usr/bin/env python
# -*- coding: utf-8 -*-
from setuptools import find_packages, setup


def read_file(file_name):
    """Read file and return its contents."""
    with open(file_name, "r", encoding="utf8") as f:
        return f.read()


def read_requirements(file_name):
    """Read requirements file as a list."""
    reqs = read_file(file_name).splitlines()
    return reqs


setup(
    name="devops-iac",
    version='1.0.0',
    author="VictorHJ",
    description="devops rampup tools",
    keywords=[],
    classifiers=[],
    package_dir={"": "."},
    packages=find_packages(where="."),
    install_requires=read_requirements("requirements.txt"),
    entry_points={"console_scripts": ["devops-iac=devops-iac.entry_point:main"]},
    python_requires=">=3.7.0,<3.8.0",
    license="",
)
