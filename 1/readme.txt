Files
=====

opt_whack.sh
------------

The shell script which performs the actions outlined
in the task description.

The script was developed and tested on a Linux host.
Running it on a Mac may be proplematic.


output.txt
----------

1. Copy-and-paste of the directory tree the script is being
   run on.
2. Copy-and-paste of the initial script output.
3. Copy-and-paste of the second script output, showing
   that files have indeed been truncated or deleted where necessary.


testdirs.tgz
------------

An archive of the directory tree used for testing purposes.
For added realism, the log files were generated with `flog`.

The test archive can be un-tarred in /opt in order to test
the script. (It will be necessary to change and directory
ownership within the test tree.)

```
ryant@localhost:~/tasks$ tree -a /opt/testdirs/
/opt/testdirs/
├── crash.dump
└── test
    ├── baz
    │   ├── apache
    │   │   ├── apache_combined.log
    │   │   ├── apache_common.log
    │   │   ├── apache_error.log
    │   │   └── .prune-enable
    │   ├── comanche
    │   │   ├── crash.dump
    │   │   └── .prune-enable
    │   ├── crash.dump
    │   └── sioux
    │       └── banshees
    │           └── .prune-enable
    └── foo
        ├── bar
        ├── eccles
        │   ├── auth
        │   ├── bloodknock
        │   │   ├── crash.dump
        │   │   ├── .prune-enable
        │   │   └── rfc3164-2.log
        │   ├── crash.dump
        │   ├── domain
        │   ├── domain.txt
        │   ├── .prune-enable
        │   ├── qwerty.gz
        │   └── rfc3164-3.log
        ├── .prune-enable
        ├── rfc3164-1.log
        └── syslog

10 directories, 22 files
```
