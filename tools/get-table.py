#!/usr/bin/env python

"""Print an HTML table of C++ and Python names."""

import sys
import cgi
import tools
import wm5

try:
    in_file = sys.argv[1]
except:
    print 'Usage: %s in_file'%(sys.argv[0],)
    sys.exit(1)

# Read the input file of C++ names.
fin = open(in_file)
lines = fin.readlines()
fin.close()

# Assemble a lookup table that maps 
# original C++ names to their Python equivalents.
cpp2py_names = {}
for cpp_name in lines:
    cpp_name = cpp_name.strip()
    py_name = tools.getPyName(cpp_name)
    cpp2py_names[cpp_name] = py_name

# Assemble a lookup table of names found in the Python module.
py_names = {}
for name in sorted(dir(wm5)):
    name = 'wm5.%s'%name
    # Skip names that have swigregister stuff in em.
    SREG = '_swigregister'
    if name[len(name) - len(SREG):] == SREG:
        continue
    py_names[name] = None


def getRow(cpp_name):
    """Return an HTML string of a row tag for the given C++ name."""
    entry_left = cgi.escape(cpp_name)
    py_equiv = cpp2py_names[cpp_name]

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

# Print the table opening tag.
print '<table class="names-table">'

# Print the table header row.
print '<tr>'
print '  <th class="names-table-header">C++ class</th>'
print '  <th class="names-table-header">Python class</th>'
print '</tr>'

# Print the individual rows.
for name in sorted(cpp2py_names):
    print getRow(name)

# Print the table closing tag.
print '</table>'

# The end.
