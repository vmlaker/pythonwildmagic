#!/usr/bin/env python
"""
Prune the superfluous files/directories from the Sphinx build directory.
"""
import subprocess
import sys
import os
try: 
    build_dir = sys.argv[1]
except:
    print 'Usage:  %s build_dir'%sys.argv[0]
    sys.exit(1)
to_prune = (
    'doctrees'          ,
    'html/.buildinfo'   ,
    'html/_sources'     ,
    'html/coverage.html',
    'html/objects.inv'  ,

    )
for entry in to_prune:
    full = os.path.join(build_dir, entry)
    cmd = 'rm -rf %s'%full
    print cmd
    subprocess.call(cmd, shell=True)
# The end.
