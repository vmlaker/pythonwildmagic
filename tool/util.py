"""A set of generic utility functions."""

import subprocess
import optparse
import sys


def run(cmd, echo=False, verbose=False):
    """Run a command in a sub-process."""
    result = []
    if echo:
        print(cmd)
    p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE)
    line = p.stdout.readline()
    while len(line):
        line = line.rstrip().decode()
        if verbose:
            print(line)
        result.append(line)
        line = p.stdout.readline()
    return result


def parse_cmd(name, 
              arguments, 
              options=None                              
              ):
    """Parse the command line. 

       Keyword arguments:
       name      - name of the command
       arguments - a list, each element being a tuple (name, descr, [option])
                   where name is the name of the argument, descr is a humanly 
                   readable description of the argument, and option is the 
                   third optional item (can be anything, usually a boolean
                   flag, e.g. True) which indicates that this argument is 
                   a list. If present, the option stops command processing 
                   after the said argument.
       options   - a list, each element being
                      (switch, name, storage, default, descr)

       If successful:
          1) If options are given, return (ARGS, OPTS) as dictionaries.
          2) If options are not supplied, return ARGS as a dictionary.
       If failed:
          Exit with code 2 if failed.
    """

    # Compute the length of the longest argument name.
    # We'll use this to make the usage columns look nice.
    length = 0
    for arg in arguments:
        length = max(len(arg[0]), length)

    # Assemble the usage string.
    usage = ' %s '%name
    if options:
        usage += '[options] '
    for arg in arguments:
        usage += '%s'%arg[0]
        if len(arg) == 3:
            usage += '...'
        usage += ' '
    usage += '\n\nArguments:'
    for arg in arguments:
        usage += '\n  %s'%arg[0]
        for ii in range(length - len(arg[0])):
            usage += ' '
        usage += '   %s'%arg[1]

    # Create the OptionParser object.
    opt_parser = optparse.OptionParser(usage=usage)
    if options:
        for option in options:
            opt_parser.add_option(option[0], 
                                  dest    = option[1], 
                                  action  = option[2], 
                                  default = option[3], 
                                  help    = option[4])

    # Parse the command line.
    OPTS, ARGS = opt_parser.parse_args()

    # Make sure arguments were given since
    # OptionParser considers them optional.
    if len(ARGS) < len(arguments):
        opt_parser.print_help()
        sys.exit(2)
    
    # Assemble ARGS in a dictionary.
    ARGS_DICT = {}
    count = 0
    for arg in arguments:
        # If this argument had the optional third element,
        # then give it the remainder of ARGS and stop processing.
        if len(arg) == 3:
            ARGS_DICT[arg[0]] = ARGS[count:]
            break
        else:
            ARGS_DICT[arg[0]] = ARGS[count]
        count += 1
    
    # Assemble OPTS in a dictionary.
    OPTS_DICT = {}
    if options:
        for opt in options:
            name = opt[1]
            exec('OPTS_DICT[name] = OPTS.%s'%name)

    # Return the parsed result.
    if options:
        result = (ARGS_DICT, OPTS_DICT)
    else:
        result = ARGS_DICT
    return result

# The end.
