#!/usr/bin/env python

"""Generate the SWIG interface file."""

# Import system modules.
import sys
import os

# Import application modules.
import cpp2py
import util

# Configure and parse the command line.
NAME = os.path.basename(sys.argv[0])
ARGS = [('include_files', 'file with a list of include files'),
        ('cpp_names', 'file with a list of C++ names'),]
ARGS = util.parse_cmd(NAME, ARGS)

# Read-in the list of include files.
includes = []
fin = open(ARGS['include_files'])
for line in fin.readlines():
    line = line.strip()
    includes.append(line)
fin.close()

# Start assembling the interface text.
result = ''
result += """\
/***********************************************************/
/*  SWIG interface file for Python Wild Magic              */
/***********************************************************/

// Module name is "wm5".
%module wm5

// Declare array helper classes.
%include "carrays.i"
%array_class(double, Arrayd);
%array_class(float, Arrayf);

"""

# Add the verbatim code block.
result += '// Verbatim code to be included in the wrapper file.\n'
result += '%{\n'
for fname in includes:
    result += '#include "%s"\n'%fname
result += '%}\n'
result += '\n'

# Add the declarations code block.
result += '// Include the file with special directives.\n'
result += '%include "special.i"\n'
result += '\n'
result += '// Declare classes from header files.\n'
for fname in includes:
    result += '%%include "%s"\n'%fname
result += '\n'

# Add the template instantiations.
result += '// Instantiate templates.\n'
table = cpp2py.get_cpp2py(ARGS['cpp_names'])
for key,val in sorted(table.items()):

    # Skip if not a template.
    if key.find('>') == -1:
        continue

    # Skip inner classes.
    if key.find('>::') != -1:
        continue

    result += '%%template (%s) %s;\n'%(val[4:], key)

# Print the interface text to standard output.
print(result)

# The end.
