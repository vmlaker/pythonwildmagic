.. _installing:

**********
Installing
**********

The following guide is intended to walk you through the installation of |NAME|, with all its software dependencies, on a Linux operating system. All Linux systems (distributions, installations, kernel versions, etc.) are not alike, and your installation experience might be different from the steps here. In case these instructions do not work verbatim for you, hopefully the intentions are clear enough so you can accomplish the steps on your system. 

1. Install Wild Magic C++ Libraries
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

In case *Make* fails with something like,

  :samp:`make: *** [build] Error 2`

it may have gone far enough along for our purposes. 
Check to see whether the needed libraries have in fact
been built:
::

  ls -la SDK/Library/Release

Make sure the following library files exist and are of non-zero size:

#. libWm5GlxGraphics.a
#. libWm5Mathematics.a

2. Get Python Development Tools and SWIG
========================================

APT (e.g. Debian or Ubuntu) users can install these with command::
 
  sudo aptitude install python-dev
  sudo aptitude install swig

YUM (e.g. Fedora or Red Hat) users can install them with::

  sudo yum install python-devel
  sudo yum install swig

3. Build and Install the Extension
==================================

Grab the |NAME| source code from the repository:
::

  svn co http://python-wild-magic.googlecode.com/svn/trunk python-wild-magic
  cd python-wild-magic

#. Edit file ``config.py`` and set the location of your Wild Magic installation.
#. Build and install the extension module using Python Distutils:
   ::

     python setup.py build
     sudo python setup.py install
     python setup.py clean2

#. Test your installation:
   ::
     
     python test.py

If the above Distutils way doesn't work for you, then try the following alternate build procedure.

#. Edit file ``Makefile`` to reflect locations of needed softwares. Of particular interest are variables in *Third-Party Software* section indicating locations of your Python and Wild Magic installations. These variables are:

   * PY\*
   * WM5\*

#. Run *Make*:
   ::

     make -j8
     make test
     make clean

.. The end.
