#!/usr/bin/env python

"""Run everything."""

# Import system modules.
import inspect
import sys
import os

# Import application modules.
import util

# Configure and parse the command line.
NAME = os.path.basename(sys.argv[0])
ARGS = [('wm5_zip', 'Wild Magic zip file'),
        ('wm5_dest', 'Wild Magic install directory'),
        ('doc_dest', 'documentation install directory'),]
ARGS = util.parse_cmd(NAME, ARGS)
 
# Remove existing environment variables.
for entry in ('WM5_PATH', 'WM5_PY_PATH'):
    if entry in os.environ:
        del os.environ[entry]

# Compute the tool/ directory.
frame = inspect.getfile(inspect.currentframe())
tool_dir = os.path.dirname(frame)

# Set the WM5_PY_PATH environment variable.
py_path = os.path.join(tool_dir, '..')
py_path = os.path.realpath(py_path)
os.environ['WM5_PY_PATH'] = py_path

# Unzip Wild Magic archive file.
cmd = 'unzip %s -d %s'%(ARGS['wm5_zip'], ARGS['wm5_dest'])
util.run(cmd, echo=True, verbose=True)

# Set the WM5_PATH environment variable.
os.environ['WM5_PATH'] = os.path.join(ARGS['wm5_dest'], 'GeometricTools', 'WildMagic5')

# Patch Wild Magic SDK.
patch_prog = os.path.join(tool_dir, 'patch-wm5.py')
cmd = '%s %s'%(patch_prog, ARGS['wm5_dest'])
util.run(cmd, echo=True, verbose=True)

# Install Wild Magic.
saved = os.getcwd()
print('cd %s'%os.environ['WM5_PATH'])
os.chdir(os.environ['WM5_PATH'])
cmd = 'make -j8 CFG=Release -f makefile.wm5'
util.run(cmd, echo=True, verbose=True)
print('cd %s'%saved)
os.chdir(saved)

# Build and install the Python module.
saved = os.getcwd()
print('cd %s'%os.environ['WM5_PY_PATH'])
os.chdir(os.environ['WM5_PY_PATH'])
cmd = '%s setup.py build'%sys.executable
util.run(cmd, echo=True, verbose=True)
cmd = '%s setup.py install --user'%sys.executable
util.run(cmd, echo=True, verbose=True)
cmd = '%s setup.py clean2'%sys.executable
util.run(cmd, echo=True, verbose=True)
print('cd %s'%saved)
os.chdir(saved)

# Run tests.
saved = os.getcwd()
print('cd %s'%os.environ['WM5_PY_PATH'])
os.chdir(os.environ['WM5_PY_PATH'])
cmd = '%s test/tiny.py'%sys.executable
util.run(cmd, echo=True, verbose=True)
cmd = '%s test/ThinPlateSplines/ThinPlateSplines.py'%sys.executable
util.run(cmd, echo=True, verbose=True)
print('cd %s'%saved)
os.chdir(saved)

# Run code analysis.
saved = os.getcwd()
print('cd %s'%os.environ['WM5_PY_PATH'])
os.chdir(os.environ['WM5_PY_PATH'])
cmd = '%s tool/create-xml.py analysis/xml `./config.py`'%sys.executable
util.run(cmd, echo=True, verbose=True)
cmd = '%s tool/parse-xml.py analysis/cpp.names analysis/xml'%sys.executable
util.run(cmd, echo=True, verbose=True)
cmd = '%s tool/compare.py analysis/cpp.names'%sys.executable
util.run(cmd, echo=True, verbose=True)
print('cd %s'%saved)
os.chdir(saved)

# Create SWIG interface file.
saved = os.getcwd()
print('cd %s'%os.environ['WM5_PY_PATH'])
os.chdir(os.environ['WM5_PY_PATH'])
cmd = "%s tool/get-cpp-files.py $WM5_PATH 'make -j8 CFG=Release -f makefile.wm5' > analysis/cpp.files"%sys.executable
util.run(cmd, echo=True, verbose=True)
cmd = '%s tool/get-include-files.py $WM5_PATH analysis/cpp.files > analysis/include.files'%sys.executable
util.run(cmd, echo=True, verbose=True)
cmd = '%s tool/get-interface.py analysis/include.files analysis/cpp.names > wm5.i.new'%sys.executable
util.run(cmd, echo=True, verbose=True)
cmd = 'diff wm5.i wm5.i.new'
util.run(cmd, echo=True, verbose=True)
print('cd %s'%saved)
os.chdir(saved)

# Create documentation.
saved = os.getcwd()
print('cd %s'%os.environ['WM5_PY_PATH'])
os.chdir(os.environ['WM5_PY_PATH'])
cmd = '%s tool/create-docs.py analysis/cpp.names doc/ %s'%(sys.executable, ARGS['doc_dest'])
util.run(cmd, echo=True, verbose=True)
print('cd %s'%saved)
os.chdir(saved)

# The end.
