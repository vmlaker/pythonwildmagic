#!/usr/bin/env python

"""Analyze Python coverage of C++."""

import sys
import cpp2py

try:
    in_file = sys.argv[1]
except:
    print 'Usage: %s in_file'%(sys.argv[0],)
    sys.exit(1)

cpp_names, py_names, cpp_in_py_names, py_in_cpp_names = cpp2py.compare(in_file)

print 'C++ names     : %9d'%(len(cpp_names),)
print 'Python names  : %9d'%(len(py_names) ,)
print 'C++ in Python : %9d'%(len(cpp_in_py_names),)
print 'Python in C++ : %9d'%(len(py_in_cpp_names),)

num_cpp_in_py = len(cpp_in_py_names)
num_cpp_names = len(cpp_names)
percent = float(num_cpp_in_py) / num_cpp_names * 100
ratio_str = '%d/%d'%(num_cpp_in_py, num_cpp_names)
print 'Coverage      : %9s (%.2f%%)'%(ratio_str, percent)

# The end.
