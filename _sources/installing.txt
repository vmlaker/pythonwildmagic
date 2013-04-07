.. _installing:

Installing
**********

This guide will walk you step-by-step through installation of |NAME| on a Linux operating system.
Specifically, it will show you how to install two things: 1) the Wild Magic C++ libraries and 2) the Python wrapper.

The steps below assume your system has a number of standard development tools available, like compilers and third-party libraries.
In case your system doesn't have one of these software dependencies, an error will surely alert you.
Fortunately, all softwares powering |NAME| are freely available on Linux.
The easiest way to obtain a missing dependency is via your distribution's package manager.
For instance, two of the things you'll need are SWIG and Python development tools.
APT (e.g. Debian or Ubuntu) users can install these with commands
::

  sudo aptitude install python-dev
  sudo aptitude install swig

YUM (e.g. Fedora or Red Hat) users can get them by running
::

  sudo yum install python-devel
  sudo yum install swig

That being said, the best thing is to proceed with steps below, resolving any dependency error that comes up by installing the missing package.
For example, while building the C++ libraries, if *Make* fails with something like,

  :samp:`GL/glu.h: No such file or directory`

check to see if you have libGLU headers on your system.
In APT repos, the package of interest is named ``libglu1-mesa-dev``, while in YUM it is ``mesa-libGLU-devel``.

Finally, note that the literal commands in this guide are written using *tcsh*, and may not translate to your particular Unix shell. 
But hopefully the intentions are made clear enough that, even in case the commands don't work verbatim for you, you'll quickly figure out how to get things running on your system.


1. Get wrapper code
===================

Unless you've already done so, grab the source code:
::

  git clone https://github.com/vmlaker/pythonwildmagic

Then, set the environment variable ``WM5_PY_PATH`` to point to location of the wrapper.
You can do this by running the following from the top of the wrapper source tree:
::

  setenv WM5_PY_PATH `pwd`


2. Install C++ libraries
========================

If you already have version 5.9 of the Wild Magic SDK installed, you may skip this step.

Download the archive file from Geometric Tools website:
::

  wget http://www.geometrictools.com/Downloads/WildMagic5p9.zip

Uncompress the archive file
(you may want to do this in a location where you normally install your other softwares.)
The following command creates a subdirectory ``GeometricTools/WildMagic5/`` which contains the Wild Magic distribution:
::

  unzip WildMagic5p9.zip

Set environment variable ``WM5_PATH`` to point to the library location:
::

  setenv WM5_PATH `pwd`/GeometricTools/WildMagic5

Before compiling, the Wild Magic SDK may need to be tweaked to work on 64-bit systems.
Program ``patch-wm5.py`` (found in the wrapper ``tools/`` directory) detects your architecture, and makes changes to makefiles if necessary.
Run the following command to apply the patch:
::

  $WM5_PY_PATH/tools/patch-wm5.py $WM5_PATH


Now run *Make* from the top of the Wild Magic source tree:
::
 
  cd $WM5_PATH
  make -j8 CFG=Release -f makefile.wm5


3. Install Python module
========================

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
     
  python tests/tiny.py

Another good test is to run
:doc:`code analysis <code_analysis>`.

.. The end.
