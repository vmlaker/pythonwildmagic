.. _index:

.. toctree::
   :hidden:

   installing
   api
   code_analysis

******
|NAME|
******

|NAME| is a Python extension wrapper of
`Geometric Tools' Wild Magic <http://www.geometrictools.com>`_
C++ libraries. It lets you make Wild Magic calls in Python. 
Here's an example:
::

  import wm5

  t1 = wm5.Transform()
  t1.SetTranslate(wm5.APoint(1, 2, 3))
  p1 = wm5.APoint(1, 1, 1)
  print p1.X(), p1.Y(), p1.Z()  # 1.0 1.0 1.0
  p1 = t1 * p1                  # Translate the point
  print p1.X(), p1.Y(), p1.Z()  # 2.0 3.0 4.0


To get up and running with |NAME|, just
:ref:`install the code <installing>`.
See what classes are wrapped by taking a look
at the :ref:`API page <api>`.

.. include:: coverage.rst

The above is a rough, liberal estimate, but a good ballpark 
figure to show progress of the project. If interested, check out the 
:ref:`code analysis procedure <code_analysis>` 
used to get these numbers.

|NAME| is a Google Code project -- it is open source.
The project home page is
`python-wild-magic.googlecode.com <http://python-wild-magic.googlecode.com>`_.
The code is developed on the Linux operating system using 
several freely available software packages:

Wild Magic 5.7
==============
  
  This is, of course, the awsome C++ library for real-time computer graphics and 
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

GCC-XML
=======

  Analysis of the C++ libraries is done with the help of
  `GCC-XML <http://www.gccxml.org>`_, the XML output extension
  to GCC. 

.. The end.
