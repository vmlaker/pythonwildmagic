#!/usr/bin/env python

"""Analyze Python coverage of C++."""

import sys
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

# Assemble a lookup table that maps Python equivalent 
# names to their original C++ names.
py2cpp_names = {}
for cpp_name in lines:
    cpp_name = cpp_name.strip()
    py_name = tools.getPyName(cpp_name)
    py2cpp_names[py_name] = cpp_name

#fout = open('cpp.names', 'w')
#for name in sorted(py2cpp_names.keys()):
#    fout.write('%s\n'%name)
#fout.close()

# Assemble a lookup table of names found in the Python module.
py_names = {}
for name in sorted(dir(wm5)):
    name = 'wm5.%s'%name
    # Skip names that have swigregister stuff in em.
    SREG = '_swigregister'
    if name[len(name) - len(SREG):] == SREG:
        continue
    py_names[name] = None

#fout = open('py.names', 'w')
#for name in sorted(py_names.keys()):
#    fout.write('%s\n'%name)
#fout.close()

# Match Python equivalents (of C++) to names in Python module.
cpp_in_py = {}
for name in py2cpp_names.keys():
    if name in py_names:
        cpp_in_py[name] = None

# Match names in Python module to Python equivalents (of C++).
py_in_cpp = {}
for name in py_names.keys():
    if name in py2cpp_names:
        py_in_cpp[name] = None

print 'C++ names     : %9d'%(len(py2cpp_names),)
print 'Python names  : %9d'%(len(py_names) ,)
print 'C++ in Python : %9d'%(len(cpp_in_py),)
print 'Python in C++ : %9d'%(len(py_in_cpp),)

num_cpp_in_py = len(cpp_in_py)
num_cpp_names = len(py2cpp_names)
percent = float(num_cpp_in_py) / num_cpp_names * 100
ratio_str = '%d/%d'%(num_cpp_in_py, num_cpp_names)
print 'Coverage      : %9s (%.2f%%)'%(ratio_str, percent)

# The end.
