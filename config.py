#!/usr/bin/env python

"""
System configuration variables for building
Wild Magic Python extension.
"""

# Location of Wild Magic installation
WM5 = '/home/vmlaker/local/wild-magic-5.7'
WM5INCDIR = '%s/SDK/Include'%WM5
WM5LIBDIR = '%s/SDK/Library/Release'%WM5

# When run as a program, dump the include directory.
if __name__ == '__main__':
    print WM5INCDIR

# The end.
