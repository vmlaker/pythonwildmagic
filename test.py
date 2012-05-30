"""
Test program for Python Wild Magic,
the Python wrapper of Geometric Tools' 
Wild Magic libraries.
"""

import wm5

t1 = wm5.Transform()
t1.SetTranslate(wm5.APoint(1, 2, 3))
p1 = wm5.APoint(1, 1, 1)
print p1.X(), p1.Y(), p1.Z()
p1 = t1 * p1
print p1.X(), p1.Y(), p1.Z()

# The end.
