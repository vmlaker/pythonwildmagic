.. _installing:

**********
Installing
**********

The following guide will walk you step-by-step through installation of |NAME| on a Linux operating system.
Specifically, it will show you how to install two things: the Wild Magic C++ libraries and the Python wrapper.
The steps below assume your system has a number of standard development tools available, like compilers and third-party libraries.
In case your system doesn't have one of these software dependencies, an error will surely alert you.
Fortunately, all softwares powering |NAME| are freely available on Linux.
The easiest way to obtain a missing dependency is using your distribution's package manager.
For instance, two of the things you'll need are SWIG and Python development tools.
APT (e.g. Debian or Ubuntu) users can install these with commands
::

  sudo aptitude install python-dev
  sudo aptitude install swig

YUM (e.g. Fedora or Red Hat) users can get them by running
::

  sudo yum install python-devel
  sudo yum install swig

That being said, the best thing is to proceed with steps below, resolving any dependency error that comes up along the way by installing the missing package.

The literal commands in this guide are written using *tcsh*, and may not translate to your particular Unix shell. 
But hopefully the intentions are made clear enough that, even in case the commands don't work verbatim for you, you'll quickly figure out how to get things running on your system.


1. Get the wrapper code
=======================

To begin, :doc:`download <download>` the wrapper code.

Then, set the environment variable ``WM5_PY_PATH`` to point to location of the wrapper.
You can do this by running the following command from the top of the wrapper source tree:
::

  setenv WM5_PY_PATH `pwd`


2. Install the C++ libraries
============================

Download the Wild Magic archive file from Geometric Tools website:
::

  wget http://www.geometrictools.com/Downloads/WildMagic5p7.zip

Uncompress the archive file
(you may want to do this in a location where you normally install your other softwares.)
The following command creates a subdirectory ``GeometricTools/WildMagic5/`` which contains the Wild Magic C++ code:
::

  unzip WildMagic5p7.zip

The library code needs to be tweaked in order to work with the Python wrapper.
The program ``patch-wm5.py`` (found in the wrapper ``tools/`` directory) makes the appropriate changes to the C++ code.
Run the following command to apply the patch:
::

  $WM5_PY_PATH/tools/patch-wm5.py GeometricTools/WildMagic5


Now run *Make* from the top of the Wild Magic source tree:
::
 
  cd GeometricTools/WildMagic5
  make -j8 CFG=Release -f makefile.wm5

In case *Make* fails with something like,

  :samp:`GL/glu.h: No such file or directory`

check to see if you have libGLU headers on your system.
In YUM repos, the package of interest is named ``mesa-libGLU-devel``, while in APT it is ``libglu1-mesa-dev``.

Having successfully run *Make*, set the environment variable ``WM5_PATH`` to point to the library location:
::

  setenv WM5_PATH `pwd`


3. Build and install the extension
==================================

From the top of the wrapper source tree, build and install the extension module using *Distutils*:
::

  cd $WM5_PY_PATH
  python setup.py build
  python setup.py install --user
  python setup.py clean2

----

If the installation was successful, congratulations!
You now have the Wild Magic module available in your Python interpreter. 
Go ahead and test it by running the following command:
::
     
  python test.py

Another good test is to run
:doc:`code analysis <code_analysis>`.

.. The end.
