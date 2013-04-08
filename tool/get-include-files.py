#!/usr/bin/env python

"""Produce a list of include files."""

# Import system modules.
import sys
import os
import re

# Import application modules.
import util


# Configure and parse the command line.
NAME = os.path.basename(sys.argv[0])
ARGS = [('wm5_path', 'location of Wild Magic'),
        ('cpp_files', 'file containing a list of C++ definition files'),]
ARGS = util.parse_cmd(NAME, ARGS)

# Get the list of .cpp files.
cpp_files = []
fin = open(ARGS['cpp_files'])
for line in fin.readlines():
    line = line.strip()
    cpp_files.append(line)
fin.close()


def getOrderedIncludes(fname, uniques):
    """Return a list of included files, sorted in a reversed
    depth-first inclusion order.

    Arguments:
    fname    -  the top seed file to be parsed
    uniques  -  dictionary of already processed files
    """
    result = []

    # Read-in the seed file.
    fin = open(fname, 'rb')
    lines = fin.readlines()
    fin.close()

    for line in lines:

        # Deal with UnicodeDecodeError: ... invalid start byte.
        try:
            line = line.decode()
        except:
            continue

        # Get the name of included file,
        # i.e. the one substring between #include" and ".
        sub = re.findall(r'#include "([^\)]+)"', line)
        if not len(sub):
            continue
        included = sub[0]
        
        # Skip if included file doesn't start with "Wm5".
        #if included[:3] != 'Wm5':
        #    continue

        # Expand the filename to the Wild Magic include directory.
        included = os.path.join(ARGS['wm5_path'], 'SDK', 'Include', included)

        # Skip if file does not exist.
        if not os.path.exists(included):
            continue

        # Skip if file was already processed.
        if included in uniques:
            continue

        # Add filename to list of processed files.
        uniques[included] = None

        # Recursively call itself on the included file,
        # appending the result to the outer-level result.
        recursed = getOrderedIncludes(included, uniques)
        result = result + recursed

    # Append the seed filename, and return the result.
    result = result + [fname]
    return result

includes = []
uniques = {}
for fname in cpp_files:
    for fname in getOrderedIncludes(fname, uniques):

        # Skip if fname doesn't end with ".h".
        if fname[len(fname)-2:] != '.h':
            continue

        base = os.path.basename(fname)
        includes.append(base)

for fname in includes:
    print(fname)

# The end.
