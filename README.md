This repo is intended to reproduce a error I am encountering while trying to use [scalene](https://github.com/plasma-umass/scalene) outside of a venv (and therefore using python-exec). This issue is not encountered inside of a venv.

The problem was encountered when trying to use scalene to profile a application that uses https://github.com/coleifer/greendb, this repo is a minimal test case demonstrating the problem (without installing greendb).

The repo https://github.com/jakeogh/test-single-exception-class-top-module is used to minimally trigger the problem greendb triggers.

Install:
```
$ git clone https://github.com/jakeogh/scalene-import-test
$ cd scalene-import-test
$ sudo ebuild dev-python/scalene-import-test/scalene-import-test-9999.ebuild merge
$ sudo ebuild dev-python/test-single-exception-class-top-module/test-single-exception-class-top-module-9999.ebuild merge
$ pip install --user scalene

```

Reproduce Error:
```
$ python -O /usr/bin/scalene-import-test
scaline-import-test: no error

$ python -O ~/.local/bin/scalene /usr/bin/scalene-import-test
Error in program being profiled:
 cannot import name 'CommandError' from 'test_single_exception_class_top_module' (/usr/bin/test_single_exception_class_top_module.py)
Traceback (most recent call last):
  File "/home/user/.local/lib/python3.10/site-packages/scalene/scalene_profiler.py", line 1633, in profile_code
    exec(code, the_globals, the_locals)
  File "/usr/bin/scalene-import-test", line 100, in <module>
    exec(data, new_globals)
  File "<string>", line 33, in <module>
  File "<string>", line 25, in importlib_load_entry_point
  File "/usr/lib/python3.10/importlib/metadata/__init__.py", line 171, in load
    module = import_module(match.group('module'))
  File "/usr/lib/python3.10/importlib/__init__.py", line 126, in import_module
    return _bootstrap._gcd_import(name[level:], package, level)
  File "<frozen importlib._bootstrap>", line 1050, in _gcd_import
  File "<frozen importlib._bootstrap>", line 1027, in _find_and_load
  File "<frozen importlib._bootstrap>", line 1006, in _find_and_load_unlocked
  File "<frozen importlib._bootstrap>", line 688, in _load_unlocked
  File "<frozen importlib._bootstrap_external>", line 883, in exec_module
  File "<frozen importlib._bootstrap>", line 241, in _call_with_frames_removed
  File "/usr/lib/python3.10/site-packages/scalene_import_test/scalene_import_test.py", line 8, in <module>
    from test_single_exception_class_top_module import CommandError
ImportError: cannot import name 'CommandError' from 'test_single_exception_class_top_module' (/usr/bin/test_single_exception_class_top_module.py)
Scalene: Program did not run for long enough to profile.

```

The line `ImportError: cannot import name 'CommandError' from 'test_single_exception_class_top_module' (/usr/bin/test_single_exception_class_top_module.py)` makes it clear what is going wrong, because:


```
ls /usr/bin/test_single_exception_class_top_module.py
0 lrwxrwxrwx 1 root root 31 2022-10-22 13:26:35 /usr/bin/test_single_exception_class_top_module.py -> ../lib/python-exec/python-exec2
```
