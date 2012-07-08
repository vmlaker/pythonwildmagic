#!/usr/bin/env python

"""Print a short summary of the code."""

# Python imports.
import datetime
import sys

# Application modules.
import version
import tools

try:
    in_file = sys.argv[1]
except:
    print 'Usage: %s in_file'%(sys.argv[0],)
    sys.exit(1)

text = 'Version %s is the latest release of the wrapper, updated on '%version.number
now = datetime.datetime.now()
text += now.strftime('%B ')
text += '%s, %s. '%(now.day, now.year)
cpp_names, py_names, cpp_in_py_names, py_in_cpp_names = tools.compare(in_file)
num_py = len(py_in_cpp_names)
num_total = len(cpp_names)
percent = float(num_py) / num_total * 100
text += 'To date, %.1f%% of the C++ API is covered in the Python module (%s classes of %s total.)'\
    %(percent, num_py, num_total)
print text

# The end.
