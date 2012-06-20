#!/usr/bin/env python

"""Run GCC-XML on Wild Magic C++ header files."""

# Python imports.
import multiprocessing
import subprocess
import sys

# Application imports.
import tools

try:
    out_dir = sys.argv[1]
    wm5_inc = sys.argv[2]
    cmd = 'mkdir -p %s'%(out_dir,)
    subprocess.Popen(cmd, shell=True).wait()
except:
    print 'Usage: %s out_dir wm5_inc'%(sys.argv[0],)
    sys.exit(1)

num_cpus = multiprocessing.cpu_count()
print 'Processing on %d CPUs'%(num_cpus,)

master = tools.GCCXMLMaster(8, wm5_inc, out_dir)
master.start()
master.join()

# The end.
