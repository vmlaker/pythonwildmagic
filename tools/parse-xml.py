#!/usr/bin/env python

"""Parse GCC-XML output files and produce a list of class names."""

# Python imports.
import multiprocessing
import sys

# Application imports.
import tools

try:
    out_file = sys.argv[1]
    in_xmls  = sys.argv[2:]
    assert (len(in_xmls) > 0)
except:
    print 'Usage: %s out_file in_xml ...'%(sys.argv[0],)
    sys.exit(1)

num_cpus = multiprocessing.cpu_count()
print 'Parsing %d files on %d CPUs'%(len(in_xmls), num_cpus,)

master = tools.ParserMaster(8, in_xmls)
master.start()
master.join()

print 'Writing file %s'%(out_file,)
fout = open(out_file, 'w')
for key in sorted(master.result.keys()):
    #print key
    fout.write('%s\n'%key)
fout.close()

# The end.
