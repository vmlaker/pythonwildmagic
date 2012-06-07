.. _index:

.. toctree::
   :hidden:
   
******
|NAME|
******

|NAME| is a Python extension wrapper for 
`Geometric Tools <http://www.geometrictools.com>`_'
Wild Magic C++ libraries.


Getting the Code
================

Check out a copy of the code from the repository:
::

  svn co http://python-wild-magic.googlecode.com/svn/trunk python-wild-magic
  cd python-wild-magic


Installation
============

#. Edit file ``config.py`` and set the location of your Wild Magic installation.
#. Build and install the extension module using Python Distutils:
   ::

     python setup.py build
     sudo python setup.py install
     python setup.py clean2

#. Test your installation:
   ::
     
     python test.py


Alternate Build using *Make*
============================
If the above standard installation procedure doesn't work for you, then try the following alternate build procedure.

#. Edit file ``Makefile`` to reflect locations of needed softwares. Of particular interest are variables in *Third-Party Software* section indicating locations of your Python and Wild Magic installations. These variables are:

   * PY\*
   * WM5\*

#. Run *Make*:
   ::

     make -j8
     make test
     make clean

.. The end.
