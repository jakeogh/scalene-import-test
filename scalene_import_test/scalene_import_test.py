#!/usr/bin/env python3
# -*- coding: utf8 -*-

import click
from greendb import CommandError


@click.command()
def cli() -> None:
    print("here")
