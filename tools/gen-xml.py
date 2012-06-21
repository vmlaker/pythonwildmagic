#!/usr/bin/env python

"""Run GCC-XML on Wild Magic C++ header files."""

# Python imports.
import multiprocessing
import subprocess
import sys
import os

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

# Assemble a list of GCC-XML command strings 
# to delegate to worker processes.
commands = []
for entry in sorted(os.listdir(wm5_inc)):
    pos = entry.rfind('.')
    if pos == -1:
        continue
    suffix = entry[pos:]
    if suffix != '.h':
        continue    
    # Assemble the paths.
    full = os.path.join(wm5_inc, entry)
    fxml = os.path.join(out_dir, entry + '.xml')
    cmd = 'gccxml %s -fxml=%s '%(full, fxml) + \
        '-I%s -I%s/../../LibGraphics/Renderers '%(wm5_inc, wm5_inc)# + \
    commands.append(cmd)

num_cpus = multiprocessing.cpu_count()
print 'Running %d commands on %d CPUs'%(len(commands), num_cpus)

master = tools.CommandMaster(8, commands)
master.start()
master.join()

# The end.
