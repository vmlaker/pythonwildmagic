#!/usr/bin/env python

"""Print a list of C++ files."""

# Import system modules.
import sys
import os

# Import application modules.
import util

# Configure and parse the command line.
NAME = os.path.basename(sys.argv[0])
ARGS = [('wm5_path', 'location of Wild Magic'),
        ('make_cmd', 'Make command used to build Wild Magic'),]
OPTS = [('-d', 'dry_run', 'store_true', False, 'dry run, don\'t actually do anything')]
ARGS, OPTS = util.parse_cmd(NAME, ARGS, OPTS)

def callMake(location, command):
    """Call the Make command at the given location.
    Location is relative to the current working directory.
    The Make command is appended "-n" (dry run mode) before being run.
    """

    # Descend into given location.
    saved = os.getcwd()
    os.chdir(location)

    # Run the Make command unconditionally (-B flag)
    # and in "dry run" mode (-n flag.)
    cmd = '%s -B -n'%command
    result = util.run(cmd)

    # Parse the Make output, looking for lines
    # that contain another sub-Make command.
    for line in result:
        if line.find(' -o ') != -1:
            for piece in line.split():
                if piece[len(piece)-4:] == '.cpp':
                    full_path = os.path.join(os.getcwd(), piece)
                    print(full_path)
            
        # Skip if line doesn't contain a Make command.
        if line.find(' make ') == -1:
            continue

        # Split the line into pieces
        # between the "&&" or ";" delimiters.
        pieces = line.split('&&')
        if len(pieces) == 1:
            pieces = line.split(';')

        # Extract the two pieces, 1) a "change directory" 
        # piece and, 2) a Make command piece.
        cd_piece = ''
        make_piece = ''
        for piece in pieces:
            piece = piece.strip()
            if piece.split()[0] == 'cd':
                cd_piece = piece
            elif piece.split()[0] == 'make':
                make_piece = piece

        # Recursively call Make.
        loc = cd_piece.split()[1]
        callMake(loc, make_piece)

    # Restore current directory.
    os.chdir(saved)

callMake(ARGS['wm5_path'], ARGS['make_cmd'])

# The end.
