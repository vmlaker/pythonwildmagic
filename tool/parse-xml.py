#!/usr/bin/env python

"""Parse GCC-XML output files and produce a list of class names."""

# import system modules.
import multiprocessing
import xml.dom.minidom
import sys
import os

# Import application modules.
import mpipe
import util

# Configure and parse the command line.
NAME = os.path.basename(sys.argv[0])
ARGS = [('out_file', 'output file'),
        ('xml_dir', 'directory with XML files'),]
ARGS = util.parse_cmd(NAME, ARGS)

# Create a list of input files.
fnames = list()
for entry in os.listdir(ARGS['xml_dir']):
    fname = os.path.join(ARGS['xml_dir'], entry)
    if not os.path.isfile(fname):
        continue
    fnames.append(fname)

num_cpus = multiprocessing.cpu_count()
print('Parsing %d files on %d CPUs'%(len(fnames), num_cpus,))

# Parse files in a pipeline.
def parseFile(fname):
    """Parse the XML file looking for fully demangled class
    names, and communicate the result."""
    names = list()
    doc = xml.dom.minidom.parse(fname)
    classes = doc.getElementsByTagName('Class')
    for entry in classes:
        name = entry.getAttribute('demangled')
        NSPACE = 'Wm5::'
        if name[:len(NSPACE)] != NSPACE:
            continue
        names.append(name)
    return names
pipe = mpipe.Pipeline(mpipe.UnorderedStage(parseFile, num_cpus))
for fname in fnames:
    pipe.put(fname)
pipe.put(None)

# Report on progress in realtime.
total_names = dict()
done_count = 0
for result in pipe.results():
    for name in result:
        total_names[name] = None
    done_count += 1
    percent = float(done_count) / len(fnames) * 100
    sys.stdout.write('\r' + '%d of %d (%.1f%%)'%(done_count, len(fnames), percent))
    sys.stdout.flush()

# End on a newline.
print()

print('Writing file %s'%ARGS['out_file'])
fout = open(ARGS['out_file'], 'w')
for key in sorted(total_names):
    fout.write('%s\n'%key)
fout.close()

# The end.
