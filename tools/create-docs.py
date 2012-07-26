#!/usr/bin/env python

"""Create the Sphinx documentation pages."""

# Import system-level modules.
import datetime
import sys
import cgi
import os

# Import application-level modules.
import version
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

def getDoc01():
    """Return the blurb on the main page."""
    result = '`Version %s '%version.number
    result += '<http://python-wild-magic.googlecode.com/files/python-wild-magic-%s.tar.gz>`_ '%version.number
    result += 'is the latest release of the wrapper, updated on '
    now = datetime.datetime.now()
    result += now.strftime('%B ')
    result += '%s, %s. '%(now.day, now.year)
    cpp_names, py_names, cpp_in_py_names, py_in_cpp_names = cpp2py.compare(ARGS['cpp_names'])
    num_py = len(py_in_cpp_names)
    num_total = len(cpp_names)
    percent = float(num_py) / num_total * 100
    result += 'To date, %.1f%% of the C++ API is covered in the Python module (%s classes of %s total.)'\
        %(percent, num_py, num_total)
    return result

def getDoc02():
    """Return the Download page blurb."""
    result = 'Version %s is the latest release, \n'%version.number
    result += 'and is available for download:\n\n'
    result += ' `python-wild-magic-%s.tar.gz '%version.number
    result += '<http://python-wild-magic.googlecode.com/files/python-wild-magic-%s.tar.gz>`_'\
        %version.number
    return result

fname = os.path.join(ARGS['docs_src'], 'source', 'text01.rst')
print 'Writing file %s'%fname
doc = getDoc01()
if not OPTS['dry_run']:
    fout = open(fname, 'w')
    fout.write(doc)
    fout.close()

fname = os.path.join(ARGS['docs_src'], 'source', 'text02.rst')
print 'Writing file %s'%fname
doc = getDoc02()
if not OPTS['dry_run']:
    fout = open(fname, 'w')
    fout.write(doc)
    fout.close()

print 'Comparing names'
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
print 'Writing file %s'%fname
if not OPTS['dry_run']:
    fout = open(fname, 'w')
    fout.write(getTable())
    fout.close()

# Build the Sphinx documentation pages.
dest = os.path.realpath(ARGS['docs_dest'])
saved = os.getcwd()
os.chdir(ARGS['docs_src'])
cmd = 'make BUILDDIR=%s html'%dest
print 'Running make in %s :'%ARGS['docs_src']
print '  %s'%cmd
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
    print cmd
    if not OPTS['dry_run']:
        util.run(cmd)

# The end.
