.. _installing:

**********
Installing
**********

The following guide will walk you step-by-step through installation of |NAME| -- with all its software dependencies -- on a Linux operating system. Of course, all Linux systems (distributions, installations, kernel versions, etc.) are not alike, and your installation experience might be different from what you see here. But hopefully the intentions are clear enough so that, even in case these instructions don't work verbatim for you, they'll help you figure out how to get things running on your system.

1. Install Wild Magic C++ libraries
===================================

Create the destination directory and ``cd`` into it:
::

  setenv DEST $HOME/local/wild-magic-5.7
  mkdir -p $DEST
  cd $DEST

Download and uncompress the archive file (note the discarding
of superfluous paths):
::

  wget http://www.geometrictools.com/Downloads/WildMagic5p7.zip
  unzip WildMagic5p7.zip
  mv GeometricTools/WildMagic5/* .
  rm -rf GeometricTools

Run *Make*:
::

  make -j8 CFG=Release -f makefile.wm5

In case *Make* fails with,

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
Once configured, build and install the extension module using Python Distutils:
::

  python setup.py build
  python setup.py install --user
  python setup.py clean2

You should now have the module available in your Python interpreter. 
To test your installation, run command:
::
     
  python test.py

3.1 Optional build using *Make*
-------------------------------

If the above Distutils way doesn't work for you, then try the following alternate build procedure.

First, edit file ``Makefile`` to reflect locations of needed softwares. 
Of particular interest are variables in *Third-Party Software* section indicating locations of your Python and Wild Magic installations. 
These variables are:

   * PY\*
   * WM5\*

With the makefile configured, run *Make*:
   ::

     make -j8
     make test
     make clean

.. The end.
