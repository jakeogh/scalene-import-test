#!/usr/bin/env python3

# this is the original line that triggers the error
# from https://github.com/coleifer/greendb
# from greendb import CommandError


from test_single_exception_class_top_module import CommandError


def cli() -> None:
    print("scaline-import-test: no error")
