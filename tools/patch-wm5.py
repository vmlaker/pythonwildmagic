#!/usr/bin/env python

"""Patch the Wild Magic source code."""

# Import system-level modules.
import sys
import os

# Import application-level modules.
import util

# Configure and parse the command line.
NAME = os.path.basename(sys.argv[0])
ARGS = [('wm5_dir', 'location of Wild Magic')]
OPTS = [('-d', 'dry_run', 'store_true', False, 'dry run, don\'t actually do anything')]
ARGS, OPTS = util.parse_cmd(NAME, ARGS, OPTS)

# A table of changes to be done to files in the source tree.
# If line# is 0, it means change all appearances of "old_text" in the file.
CHANGES = [
    # file to change  line#  old text  replacement text
    # --------------  -----  --------  ----------------
    #
    # Add a cast to Real* operator. 
    ('Wm5GMatrix.h', 60, '', 'operator Real*() { return *mEntry; }'),
    #
    # Include file Wm5GlExtensions.h.
    ('Wm5GlUtility.h', 13, '', '#include \"Wm5GlExtensions.h\"'),
    #
    # Include file Wm5Memory.h.
    ('Wm5UniqueVerticesTriangles.h', 14, '', '#include \"Wm5Memory.h\"'),
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
    for found in util.run(cmd):
        fname = found.strip()
        
        cmd = 'grep "%s" %s'%(old_text, fname)
        if not len(util.run(cmd)):
            continue

        backup = fname + '.orig'
        cmd = 'cp %s %s'%(fname, backup)
        print 'Saving file   : %s'%backup
        if not OPTS['dry_run']:
            util.run(cmd)

        if line_num:
            if len(old_text):
                cmd = "sed -i %ds/'%s'/'%s'/g %s"%(line_num, old_text, new_text, fname)
            else:
                # Empty old_text means "add" instead of "replace."
                cmd = "sed -i %di\'%s\' %s"%(line_num, new_text, fname)
        else:
            # Line number == 0 means "change all."
            cmd = "sed -i s/'%s'/'%s'/g %s"%(old_text, new_text, fname)
        print 'Changing file : %s'%fname
        print 'Command       : %s'%cmd
        if not OPTS['dry_run']:
            util.run(cmd)

        continue
        print 'Diff:'
        cmd = 'diff %s %s'%(backup, fname)
        for line in util.run(cmd):
            print line
            pass

# The end.
