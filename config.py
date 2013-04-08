#!/usr/bin/env python

"""
System configuration variables for building
Wild Magic Python extension.
"""
import os

# Location of Wild Magic installation
WM5 = os.environ['WM5_PATH']
WM5INCDIR = os.path.join(WM5, 'SDK', 'Include')
WM5LIBDIR = os.path.join(WM5, 'SDK', 'Library', 'Release')

# When run as a program, dump the include directory.
if __name__ == '__main__':
    print(WM5INCDIR)

# The end.
