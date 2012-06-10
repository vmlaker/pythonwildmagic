.. _index:

.. toctree::
   :hidden:

   installing
   
******
|NAME|
******

|NAME| is a Python extension wrapper of
`Geometric Tools' Wild Magic <http://www.geometrictools.com>`_
C++ libraries. It lets you make Wild Magic
calls in Python. Here's an example:
::

  import wm5

  t1 = wm5.Transform()
  t1.SetTranslate(wm5.APoint(1, 2, 3))
  p1 = wm5.APoint(1, 1, 1)
  print p1.X(), p1.Y(), p1.Z()  # 1.0 1.0 1.0
  p1 = t1 * p1                  # Translate the point
  print p1.X(), p1.Y(), p1.Z()  # 2.0 3.0 4.0


|NAME| is developed on the Linux operating system using 
several freely available software packages:

Wild Magic 5.7
==============
  
  This is the most excellent C++ library for real-time computer graphics and 
  physics, mathematics, geometry, numerical analysis, and image analysis.
  The source code is generously made freely downloadable from
  `www.geometrictools.com <http://www.geometrictools.com>`_.

Python 2
========

  The Python extension is developed with language of version
  somewhere in the range of 2.6 and 2.7.
  Any recent version of Python 2 should work (but not so sure
  about Python 3.)

SWIG
====
  
  The `SWIG <http://www.swig.org>`_ 
  interface compiler is used to wrap the 
  C++ libraries into Python API.

To get up and running with |NAME|, just
:ref:`install <installing>` the code.

.. The end.
