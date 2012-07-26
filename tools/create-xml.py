#!/usr/bin/env python

"""Run GCC-XML on Wild Magic C++ header files."""

# Import system modules.
import multiprocessing
import subprocess
import sys
import os

# Import application modules.
import master
import util

# Configure and parse the command line.
NAME = os.path.basename(sys.argv[0])
ARGS = [('out_dir', 'output directory'),
        ('wm5_inc', 'Wild Magic SDK include directory'),]
ARGS = util.parse_cmd(NAME, ARGS)

# Create the output directory.
util.run('mkdir -p %s'%ARGS['out_dir'])

# Assemble a list of GCC-XML command strings 
# to delegate to worker processes.
commands = []
for entry in sorted(os.listdir(ARGS['wm5_inc'])):
    pos = entry.rfind('.')
    if pos == -1:
        continue
    suffix = entry[pos:]
    if suffix != '.h':
        continue    
    # Assemble the paths.
    full = os.path.join(ARGS['wm5_inc'], entry)
    fxml = os.path.join(ARGS['out_dir'], entry + '.xml')
    cmd = 'gccxml %s -fxml=%s '%(full, fxml) + \
        '-I%s -I%s/../../LibGraphics/Renderers '%(ARGS['wm5_inc'], ARGS['wm5_inc']) + \
        '-D__LINUX__ ' #+ \
    commands.append(cmd)

num_cpus = multiprocessing.cpu_count()
print 'Running %d commands on %d CPUs'%(len(commands), num_cpus)

master = master.CommandMaster(8, commands)
master.start()
master.join()

# The end.
