This repo is intended to reproduce a error I am encountering while trying to use [scalene](https://github.com/plasma-umass/scalene).

Install:
```
$ git clone https://github.com/jakeogh/scalene-import-test
$ cd scalene-import-test
$ sudo -i ebuild dev-python/scalene-import-test/scalene-import-test-9999.ebuild merge
$ sudo -i ebuild dev-python/greendb/greendb-9999.ebuild merge
$ pip install --user scalene

```

Reproduce Error:
```
$ python -O ~/.local/bin/scalene /usr/bin/scalene-import-test
Error in program being profiled:
 cannot import name 'CommandError' from 'greendb' (/usr/bin/greendb.py)
Traceback (most recent call last):
  File "/home/user/.local/lib/python3.10/site-packages/scalene/scalene_profiler.py", line 1633, in profile_code
    exec(code, the_globals, the_locals)
  File "/usr/bin/scalene-import-test", line 99, in <module>
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
  File "/usr/lib/python3.10/site-packages/scalene_import_test/scalene_import_test.py", line 4, in <module>
    from greendb import CommandError
ImportError: cannot import name 'CommandError' from 'greendb' (/usr/bin/greendb.py)
Scalene: Program did not run for long enough to profile.

$ python -O /usr/bin/scalene-import-test
here

```


