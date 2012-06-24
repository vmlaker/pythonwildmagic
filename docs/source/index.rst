.. _index:

.. toctree::
   :hidden:

   download
   installing
   code_analysis
   api
   about

******
|NAME|
******

|NAME| is a Python extension wrapper of
`Geometric Tools' Wild Magic <http://www.geometrictools.com>`_
C++ libraries. *It lets you make Wild Magic calls in Python!*
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
To see what classes are wrapped, take a look 
at :ref:`Index <genindex>` or :ref:`API page <api>`.

.. include:: coverage.rst

That's a rough ballpark figure for a sense of how the wrapper coverage is progressing. If interested, be sure to check out the 
:ref:`code analysis procedure <code_analysis>` 
used to arrive at this number.

.. The end.
