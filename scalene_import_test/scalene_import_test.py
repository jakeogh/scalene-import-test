#!/usr/bin/env python3

# this triggers the error
from greendb import CommandError

# this does not https://github.com/jakeogh/test-single-exception-class
# from test_single_exception_class import SomeValueError


def cli() -> None:
    print("here")
