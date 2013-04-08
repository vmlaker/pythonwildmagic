#!/usr/bin/env python

"""Create the Sphinx documentation pages."""

# Import system-level modules.
import datetime
import sys
import cgi
import os

# Import application-level modules.
import cpp2py
import util

# Configure and parse the command line.
NAME = os.path.basename(sys.argv[0])
ARGS = [('cpp_names', 'file with C++ names'),
        ('docs_src', 'documentation source directory'),
        ('docs_dest', 'documentation destination directory'),
        ]
OPTS = [('-d', 'dry_run', 'store_true', False, 'dry run, don\'t actually do anything')]
ARGS, OPTS = util.parse_cmd(NAME, ARGS, OPTS)

def getBlurb():
    """Return the blurb for the names page."""
    cpp_names, py_names, cpp_in_py_names, py_in_cpp_names = cpp2py.compare(ARGS['cpp_names'])
    num_py = len(py_in_cpp_names)
    num_total = len(cpp_names)
    percent = float(num_py) / num_total * 100
    result = '%.1f%% of the Wild Magic C++ API is covered by the :mod:`wm5` module (%s classes of %s total.) '\
        %(percent, num_py, num_total)
    result += 'The table below matches C++ classes with their Python counterparts.'
    return result    

for func, fname in (
    (getBlurb, 'blurb.rst'),
    ):
    fname = os.path.join(ARGS['docs_src'], 'source', fname)
    print('Writing file %s'%fname)
    doc = func()
    if not OPTS['dry_run']:
        fout = open(fname, 'w')
        fout.write(doc)
        fout.close()

print('Comparing names')
cpp_names, py_names, cpp_in_py_names, py_in_cpp_names = cpp2py.compare(ARGS['cpp_names'])

def getRow(cpp_name):
    """Return an HTML string of a row tag for the given C++ name."""
    entry_left = cgi.escape(cpp_name)
    py_equiv = cpp_names[cpp_name]

    # Decide on the right-side column entry and the row color, based on
    # whether the Python name is present in the Python module.
    cname = 'names-table-row-yes'
    entry_right = py_equiv
    if py_equiv not in py_names:
        cname = 'names-table-row-no'
        entry_right = ''

    # Assemble and return the table row tag.
    result  = '<tr class="%s">\n'%cname
    result += '  <td class="%s">%s</td>\n'%('names-table-data', entry_left)
    result += '  <td class="%s">%s</td>\n'%('names-table-data', entry_right)
    result += '</tr>'
    return result

def getTable():
    result = ''

    # Add the table opening tag.
    result += '<table class="names-table">\n'  

    # Add the table header row.
    result += '<tr>\n'
    result += '  <th class="names-table-header">C++ class</th>\n'
    result += '  <th class="names-table-header">Python class</th>\n'
    result += '</tr>\n'

    # Add the individual rows.
    for name in sorted(cpp_names):
        result += '%s\n'%getRow(name)

    # Add the table closing tag.
    result += '</table>\n'
    
    return result

# Write the table of class names.
fname = os.path.join(ARGS['docs_src'], 'source', 'names_table.html')
print('Writing file %s'%fname)
if not OPTS['dry_run']:
    fout = open(fname, 'w')
    fout.write(getTable())
    fout.close()

# Export diagrams.
location = os.path.join(ARGS['docs_src'], 'source')
diagrams = (
    'code_analysis_01',
    'code_analysis_02',
    'swig_interface_01',
    'swig_interface_02',
    'swig_interface_03',
    )
print('Exporting diagrams.')
for diagram in diagrams:
    in_fname = os.path.join(location, '%s.dia'%diagram)
    out_fname = os.path.join(location, '%s.png'%diagram)
    cmd = 'dia -e %s %s'%(out_fname, in_fname)
    print('  %s'%cmd)
    if not OPTS['dry_run']:
        util.run(cmd)

# Build the Sphinx documentation pages.
dest = os.path.realpath(ARGS['docs_dest'])
saved = os.getcwd()
os.chdir(ARGS['docs_src'])
cmd = 'make BUILDDIR=%s html'%dest
print('Running make in %s :'%ARGS['docs_src'])
print('  %s'%cmd)
if not OPTS['dry_run']:
    util.run(cmd)
os.chdir(saved)

# Prune the superfluous files/directories from the Sphinx build directory.
to_prune = (
    'doctrees',
    'html/.buildinfo',
    'html/_images',
    'html/_sources',
    'html/objects.inv',
    'html/text01.rst',
    'html/text02.rst',
    )
for entry in to_prune:
    full = os.path.join(ARGS['docs_src'], 'build', entry)
    cmd = 'rm -rf %s'%full
    print(cmd)
    if not OPTS['dry_run']:
        util.run(cmd)

# The end.
