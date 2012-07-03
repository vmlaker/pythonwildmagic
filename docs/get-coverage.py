#!/usr/bin/env python

"""Print code coverage information."""

# Python imports.
import subprocess
import sys
import re

try:
    in_file = sys.argv[1]
except:
    print 'Usage: %s in_file'%(sys.argv[0],)
    sys.exit(1)

num_py  = '!!! MISSING !!!'
num_cpp = '!!! MISSING !!!'
percent = '!!! MISSING !!!'

cmd = '../tools/compare.py %s | tail -1'%(in_file,)
p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE)
p.wait()
line = p.stdout.readlines()[0]
values = re.findall(r'[0-9]+\.*[0-9]*', line)
num_py = int(values[0])
num_total = int(values[1])
percent = values[2]
text = '**%s** of **%s** classes (**%s%%**) are wrapped' \
    %(num_py, num_total, percent)
print text

# The end.
