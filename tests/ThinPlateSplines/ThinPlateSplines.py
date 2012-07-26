# This file is a Python translation of the original C++ implementation.
# Original file header comment:
#
#   Geometric Tools, LLC
#   Copyright (c) 1998-2012
#   Distributed under the Boost Software License, Version 1.0.
#   http://www.boost.org/LICENSE_1_0.txt
#   http://www.geometrictools.com/License/Boost/LICENSE_1_0.txt
#
#   File Version: 5.6.1 (2012/07/07)

import wm5

class ThinPlateSplines(wm5.ConsoleApplication):

    def __init__(self):
        pass

    def TestThinPlateSplines2D(self):
        outFile = open('output2.txt', 'wt')

        # Tabulated data on a 3x3 regular grid, points of form (x,y,f(x,y)).
        numPoints = 9
        XVALS = (0.0, 0.5, 1.0,
                 0.0, 0.5, 1.0,
                 0.0, 0.5, 1.0,)
        YVALS = (0.0, 0.0, 0.0,
                 0.5, 0.5, 0.5,
                 1.0, 1.0, 1.0,)
        FVALS = (1.0, 2.0, 3.0,
                 3.0, 2.0, 1.0,
                 1.0, 2.0, 3.0,)        
        x = wm5.Arrayd(numPoints)
        y = wm5.Arrayd(numPoints)
        f = wm5.Arrayd(numPoints)
        for ii in range(numPoints):
            x[ii] = XVALS[ii]
            y[ii] = YVALS[ii]
            f[ii] = FVALS[ii]

        # Resample on a 7x7 regular grid.
        numResample = 6
        invResample = 1.0/float(numResample)
        smooth = 0.0
        interp = 0.0
        functional = 0.0

        # No smoothing, exact interpolation at grid points.
        smooth = 0.0
        noSmooth = wm5.IntpThinPlateSpline2d(numPoints, x, y, f, smooth, False, False)
        outFile.write('no smoothing (smooth parameter is 0.0)\n')
        for j in range(numResample+1):
            for i in range(numResample+1):
                interp = noSmooth(invResample*i, invResample*j)
                outFile.write('%lf '%interp);
            outFile.write('\n')

        functional = noSmooth.ComputeFunctional()
        outFile.write('functional = %lg\n'%functional)
        outFile.write('\n')

        # Increasing amounts of smoothing.
        smooth = 0.1
        for k in range(1,7):
            
            spline = wm5.IntpThinPlateSpline2d(numPoints, x, y, f, smooth, False, False)
            outFile.write('smoothing (parameter is %lf)\n'%smooth)
            for j in range(numResample+1):
                for i in range(numResample+1):
                    interp = spline(invResample*i, invResample*j)
                    outFile.write('%lf '%interp)
                outFile.write('\n')
            functional = spline.ComputeFunctional()
            outFile.write('functional = %lg\n'%functional)
            outFile.write('\n')
            smooth *= 10.0

        outFile.close()


    def TestThinPlateSplines3D(self):
        outFile = open('output3.txt', 'wt')

        # Tabulated data on a 3x3x3 regular grid, points (x,y,z,f(x,y,z)).
        numPoints = 27
        x = wm5.Arrayd(numPoints)
        y = wm5.Arrayd(numPoints)
        z = wm5.Arrayd(numPoints)
        f = wm5.Arrayd(numPoints)
        xdomain = 0.0
        ydomain = 0.0
        zdomain = 0.0
        index = 0
        for k in range(3):
            zdomain = 0.5 * k
            for j in range(3):
                ydomain = 0.5 * j
                for i in range(3):
                    xdomain = 0.5 * i
                    x[index] = xdomain
                    y[index] = ydomain
                    z[index] = zdomain
                    f[index] = wm5.Mathd.UnitRandom()
                    index += 1

        # Resample on a 7x7x7 regular grid.
        numResample = 6
        invResample = 1.0/float(numResample)
        smooth = 0.0
        interp = 0.0
        functional = 0.0

        # No smoothing, exact interpolation at grid points.
        smooth = 0.0
        noSmooth = wm5.IntpThinPlateSpline3d(numPoints, x, y, z, f, smooth, False, False)
        outFile.write('no smoothing (smooth parameter is 0.0)\n')

        for k in range(numResample + 1):
            zdomain = invResample * k

            for j in range(numResample + 1):
                ydomain = invResample * j

                for i in range(numResample + 1):
                    xdomain = invResample * i
                    interp = noSmooth(xdomain, ydomain, zdomain)
                   
                    outFile.write('%lf '%interp)
                outFile.write('\n')
            outFile.write('\n')

        functional = noSmooth.ComputeFunctional()
        outFile.write('functional = %lg\n'%functional)
        outFile.write('\n')

        # Increasing amounts of smoothing.
        smooth = 0.1
        for ell in range (1,7):
            spline = wm5.IntpThinPlateSpline3d(numPoints, x, y, z, f, smooth, False, False)
            outFile.write('smoothing (parameter is %lf)\n'%smooth)
            for k in range(numResample + 1):
                zdomain = invResample * k
                for j in range(numResample + 1):
                    ydomain = invResample * j
                    for i in range(numResample + 1):
                        xdomain = invResample * i
                        interp = spline(xdomain, ydomain, zdomain)
                        outFile.write('%lf '%interp)
                    outFile.write('\n')
                outFile.write('\n')
            functional = spline.ComputeFunctional()
            outFile.write('functional = %lg\n'%functional)
            outFile.write('\n')
            smooth *= 10.0

        outFile.close()

    def Main(self):
        self.TestThinPlateSplines2D()
        self.TestThinPlateSplines3D()
        return 0

app = ThinPlateSplines()
app.Main()

# The end.
