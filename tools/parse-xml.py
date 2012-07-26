#!/usr/bin/env python

"""Parse GCC-XML output files and produce a list of class names."""

# import system modules.
import multiprocessing
import sys
import os

# Import application modules.
import master
import util

# Configure and parse the command line.
NAME = os.path.basename(sys.argv[0])
ARGS = [('out_file', 'output file'),
        ('in_xmls', 'list of input XML files', True),]
ARGS = util.parse_cmd(NAME, ARGS)

num_cpus = multiprocessing.cpu_count()
print 'Parsing %d files on %d CPUs'%(len(ARGS['in_xmls']), num_cpus,)

master = master.ParserMaster(8, ARGS['in_xmls'])
master.start()
master.join()

print 'Writing file %s'%ARGS['out_file']
fout = open(ARGS['out_file'], 'w')
for key in sorted(master.result.keys()):
    #print key
    fout.write('%s\n'%key)
fout.close()

# The end.
