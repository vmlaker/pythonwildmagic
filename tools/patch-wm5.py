#!/usr/bin/env python

"""Patch the Wild Magic source code."""

# Import system-level modules.
import subprocess
import sys
import os

# Import application-level modules.
import tools

# Configure the command.
NAME = os.path.basename(sys.argv[0])
ARGS = [('wm5_dir', 'location of Wild Magic')]
OPTS = [('-d', 'dry_run', 'store_true', False, 'dry run, don\'t actually do anything')]

# Parse the command line.
ARGS, OPTS = tools.parse_cmd(NAME, ARGS, OPTS)

def run(cmd):
    p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE)
    p.wait()
    result = []
    for line in p.stdout.readlines():
        result.append(line.rstrip())
    return result

# A table of changes to be done to files in the source tree.
# If line# is 0, it means change all appearances of "old_text" in the file.
CHANGES = [
    # file to change     line#  old text    replacement text
    # --------------     -----  ---------   ----------------
    #
    # This function is not defined, so comment-out its declaration.
    ('Wm5Environment.h',   43,  'static',   '\/\/ static'),  
    #
    # Add a cast to Real* operator. 
    ('Wm5GMatrix.h',       60,  '',         'operator Real*() { return *mEntry; }'),
    #
    # Fix a typo bug.
    ('Wm5GMatrix.inl',    478,  'mEntry',   'srcEntry'),
    ]

# These changes are only needed on 64-bit architectures.
CHANGES_64BIT = [
    ('makefile.wm5',     0, 'CFLAGS := ', 'CFLAGS := -fPIC '),
    ('makeprj.wm5',      0, 'CFLAGS := ', 'CFLAGS := -fPIC '),
    ('makerend.wm5',     0, 'CFLAGS := ', 'CFLAGS := -fPIC '),
    ]

# In case of 64-bit architecture, apply the specific changes.
if sys.maxsize == 2**63-1:
    CHANGES += CHANGES_64BIT

for change in CHANGES:
    fname = change[0]
    line_num = change[1]
    old_text = change[2]
    new_text = change[3]
    cmd = 'find %s -name %s'%(ARGS['wm5_dir'], fname)
    for found in run(cmd):
        fname = found.strip()
        
        cmd = 'grep "%s" %s'%(old_text, fname)
        if not len(run(cmd)):
            continue

        backup = fname + '.orig'
        cmd = 'cp %s %s'%(fname, backup)
        if not OPTS['dry_run']:
            run(cmd)
        print 'Saved file %s'%backup
        print 'Changing file %s'%fname

        if line_num:
            if len(old_text):
                cmd = 'sed -i %ds/"%s"/"%s"/g %s'%(line_num, old_text, new_text, fname)
            else:
                # Empty old_text means "add" instead of "replace."
                cmd = 'sed -i %di\"%s\" %s'%(line_num, new_text, fname)
        else:
            # Line number == 0 means "change all."
            cmd = 'sed -i s/"%s"/"%s"/g %s'%(old_text, new_text, fname)
        print cmd
        if not OPTS['dry_run']:
            run(cmd)

        continue
        print 'Diff:'
        cmd = 'diff %s %s'%(backup, fname)
        for line in run(cmd):
            print line
            pass

# The end.
