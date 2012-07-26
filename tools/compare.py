#!/usr/bin/env python

"""Analyze Python coverage of C++."""

import os
import sys
import util
import cpp2py

# Configure and parse the command line.
NAME = os.path.basename(sys.argv[0])
ARGS = [('cpp_names', 'file with C++ names')]
ARGS = util.parse_cmd(NAME, ARGS)

cpp_names, py_names, cpp_in_py_names, py_in_cpp_names = cpp2py.compare(ARGS['cpp_names'])

print 'C++ names     : %9d'%len(cpp_names)
print 'Python names  : %9d'%len(py_names)
print 'C++ in Python : %9d'%len(cpp_in_py_names)
print 'Python in C++ : %9d'%len(py_in_cpp_names)

num_cpp_in_py = len(cpp_in_py_names)
num_cpp_names = len(cpp_names)
percent = float(num_cpp_in_py) / num_cpp_names * 100
ratio_str = '%d/%d'%(num_cpp_in_py, num_cpp_names)
print 'Coverage      : %9s (%.2f%%)'%(ratio_str, percent)

# The end.
