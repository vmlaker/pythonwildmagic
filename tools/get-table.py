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
    color_yes = '#edffed'
    color_no = '#ffeded'
    entry_left = cgi.escape(cpp_name)
    py_equiv = cpp2py_names[cpp_name]

    # Decide on the right column entry and the row color, based on
    # whether the Python name is present in the Python module.
    color = color_yes
    entry_right = py_equiv
    if py_equiv not in py_names:
        color = color_no
        entry_right = ''

    # Assemble and return the table row tag.
    style = 'background-color: %s; '%color
    result  = '<tr style="%s">\n'%style
    style = 'padding: 1px 10px 1px 10px; '
    result += '  <td style="%s">%s</td>\n'%(style, entry_left)
    result += '  <td style="%s">%s</td>\n'%(style, entry_right)
    result += '</tr>'
    return result

# Print the table opening tag.
style  = 'background-color: #dddddd; '
style += 'border: 1px solid #bbbbbb; '
style += 'border-spacing: 1px; '
style += 'border-collapse: separate; '
print '<table style="%s">'%style

# Print the table header row.
style  = 'background-color: #ededff; '
style += 'text-align: center; '
print '<tr>'
print '  <th style="%s">C++ class</th>'%style
print '  <th style="%s">Python class</th>'%style
print '</tr>'

# Print the individual rows.
for name in sorted(cpp2py_names):
    print getRow(name)

# Print the table closing tag.
print '</table>'

# The end.
