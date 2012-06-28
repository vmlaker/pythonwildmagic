#!/usr/bin/env python

"""Generate a starter SWIG library file."""

# Python imports.
import subprocess
import sys
import os

# Application imports.
import tools

try:
    wm5_dir = sys.argv[1]
    in_file = sys.argv[2]
except:
    print 'Usage: %s wm5_dir in_file'%(sys.argv[0],)
    sys.exit(1)

WM5_DIRS = [
    'LibCore', 
    'LibCore/Assert', 
    'LibCore/DataTypes', 
    'LibCore/InputOutput', 
    'LibCore/Memory', 
    'LibCore/ObjectSystems', 
    'LibCore/Threading', 
    'LibCore/Time', 
    'LibMathematics', 
    'LibMathematics/Algebra', 
    'LibMathematics/Approximation', 
    'LibMathematics/Base', 
    'LibMathematics/ComputationalGeometry', 
    'LibMathematics/Containment', 
    'LibMathematics/CurvesSurfacesVolumes', 
    'LibMathematics/Distance', 
    'LibMathematics/Interpolation', 
    'LibMathematics/Intersection', 
    'LibMathematics/Meshes', 
    'LibMathematics/Miscellaneous', 
    'LibMathematics/NumericalAnalysis', 
    'LibMathematics/Objects2D',
    'LibMathematics/Objects3D', 
    'LibMathematics/Query', 
    'LibMathematics/Rational', 
    'LibImagics', 
    'LibImagics/BinaryOperations', 
    'LibImagics/Extraction',
    'LibImagics/Filters',
    'LibImagics/Images', 
    'LibImagics/RasterDrawing', 
    'LibImagics/Segmenters',
    'LibPhysics',
    'LibPhysics/Fluid',
    'LibPhysics/CollisionDetection',
    'LibPhysics/Intersection',
    'LibPhysics/LCPSolver',
    'LibPhysics/ParticleSystem',
    'LibPhysics/RigidBody',
    'LibGraphics',
    'LibGraphics/Controllers',
    'LibGraphics/CurvesSurfaces',
    'LibGraphics/DataTypes',
    'LibGraphics/Detail', 
    'LibGraphics/GlobalEffects',
    'LibGraphics/ImageProcessing', 
    'LibGraphics/LocalEffects',
    'LibGraphics/Renderers',
    'LibGraphics/Renderers/OpenGLRenderer',
    'LibGraphics/Resources',
    'LibGraphics/SceneGraph', 
    'LibGraphics/ShaderFloats', 
    'LibGraphics/Shaders', 
    'LibGraphics/Sorting',
    'LibGraphics/Terrain',
    ]

print '%module wm5'
print '%{'

for item in WM5_DIRS:
    print '//  %s'%item
    full = os.path.join(wm5_dir, item)
    #print full

    cmd = 'find %s -maxdepth 1 -name \'*.h\' -printf \'%%f\\n\''\
        %(full)
    #print cmd
    p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE)
    p.wait()
    for fname in sorted(p.stdout.readlines()):
        fname = fname.strip()
        print '#include \"%s"'%fname

print '%}'

for item in WM5_DIRS:
    print '//  %s'%item
    full = os.path.join(wm5_dir, item)
    #print full

    cmd = 'find %s -maxdepth 1 -name \'*.h\' -printf \'%%f\\n\''\
        %(full)
    #print cmd
    p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE)
    p.wait()
    for fname in sorted(p.stdout.readlines()):
        fname = fname.strip()
        print '%%include \"%s"'%fname

# Read the input file of C++ names.
fin = open(in_file)
lines = fin.readlines()
fin.close()

# Assemble a lookup table of C++ names.
for name in lines:
    name = name.strip()
    py_equiv = name

    # Change the trailing template args.
    FTEMPL = '<float>'
    DTEMPL = '<double>'
    if py_equiv[len(py_equiv)-len(FTEMPL):] == FTEMPL:
        # Change the trailing '<float>' to 'f'.
        py_equiv = py_equiv[:len(py_equiv)-len(FTEMPL)] + 'f'
    elif py_equiv[len(py_equiv)-len(DTEMPL):] == DTEMPL:
        # Change the trailing '<double>' to 'd'.
        py_equiv = py_equiv[:len(py_equiv)-len(DTEMPL)] + 'd'
    else:
        continue
    
    # Trim off the leading 'Wm5::' namespace designation.
    NSPACE = 'Wm5::'
    if py_equiv[:len(NSPACE)] == NSPACE:
        py_equiv = py_equiv[len(NSPACE):]
    print '%%template (%s) %s;'%(py_equiv, name)


# The end.
