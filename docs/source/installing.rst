.. _installing:

**********
Installing
**********

The following guide will walk you step-by-step through installation of |NAME| -- with all its software dependencies -- on a Linux operating system. Of course, all Linux systems (distributions, installations, kernel versions, etc.) are not alike, and your installation experience might be different from what you see here. But hopefully the intentions are clear enough so that, even in case these instructions don't work verbatim for you, they'll help you figure out how to get things running on your system.

1. Install Wild Magic C++ libraries
===================================

Download and uncompress the archive file:
::

  wget http://www.geometrictools.com/Downloads/WildMagic5p7.zip
  unzip WildMagic5p7.zip

This created a sudirectory ``GeometricTools/WildMagic5/`` which contains the Wild Magic C++ code.
Now run *Make*:
::
 
  cd GeometricTools/WildMagic5
  make -j8 CFG=Release -f makefile.wm5

In case *Make* fails with something like,

  :samp:`GL/glu.h: No such file or directory`

check to see if you have libGLU headers on your system.
In YUM repos, the package of interest is named ``mesa-libGLU-devel``.

2. Get Python development tools and SWIG
========================================

APT (e.g. Debian or Ubuntu) users can install these with command::
 
  sudo aptitude install python-dev
  sudo aptitude install swig

YUM (e.g. Fedora or Red Hat) users can install them with::

  sudo yum install python-devel
  sudo yum install swig

3. Build and install the extension
==================================

First, grab the |NAME| source code from the repository:
::

  svn co http://python-wild-magic.googlecode.com/svn/trunk python-wild-magic
  cd python-wild-magic

Then, edit file ``config.py`` and set the location of your Wild Magic installation.
Once configured, build and install the extension module using Distutils:
::

  python setup.py build
  python setup.py install --user
  python setup.py clean2

In case ``python setup.py build`` command fails with an error similar to the following,
::

  relocation R_X86_64_32 against `.rodata.str1.1' can not be used when making a shared object; recompile with -fPIC
  could not read symbols: Bad value

you'll have to return to step 1 and re-compile Wild Magic with the ``-fPIC`` flag.
Easiest thing is to change all makefiles, appending the flag to the ``CFLAGS`` variable, then run "make clean" before re-building the whole thing.

----

If the installation was successful, congratulations!
You now have the Wild Magic module available in your Python interpreter. 
Go ahead and test it by running the following command:
::
     
  python test.py

Another good test is to run
:doc:`code analysis <code_analysis>`.

.. The end.
