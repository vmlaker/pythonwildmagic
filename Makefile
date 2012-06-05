##################################################
#  Makefile for building Python wrappers of
#  Geometric Tools' Wild Magic Libraries.
##################################################

##################################################
#  Compiler Variables
##################################################
CXX       = g++
CXXFLAGS  = -c -Wall
LDFLAGS   = 

##################################################
#  Third-Party Software
#
#  Set the following variables in order to tell
#  Make where all third-party dependencies are
#  located.
##################################################
# SWIG installation.
SWIG      = swig
SWIGOPTS  = 
#SWIGOPTS  = -v -debug-classes -debug-template 

# Python installation.
PYINCDIR  = /usr/include/python2.7
PYLIBDIR  = /usr/lib64
PYLIB     = -lpython2.7

# Wild Magic installation.
WM5       = /usr/local/wild-magic-5.7
WM5INCDIR = $(WM5)/SDK/Include
WM5LIBDIR = $(WM5)/SDK/Library/Release
WM5LIB    = -lWm5Mathematics -lWm5GlxGraphics

##################################################
#  The Rules
##################################################
LIBRARY   = _wm5.so
OBJECT    = wm5_wrap.o
PATCHED   = wm5_wrap_patched.C
WRAPPER   = wm5_wrap.C
INTERFACE = wm5.i

all :	$(LIBRARY)

$(LIBRARY) : $(OBJECT)
	$(CXX) -O2 -pthread -shared $(OBJECT) -L$(PYLIBDIR) $(PYLIB) -L$(WM5LIBDIR) $(WM5LIB) -o _wm5.so

$(OBJECT) : $(PATCHED)
	$(CXX) -O2 -fpic -I$(PYINCDIR) -I$(WM5INCDIR) -c $(PATCHED) -o $(OBJECT)

# Patch the generated wrapper .C file. This is needed because I was not able to 
# rename the operators in SWIG interface with the namespace qualifiers in order 
# to deal with the warning: 
#    Warning(503): Can't wrap 'operator xxx' unless renamed to a valid identifier.
# Instead, the operators are renamed without the namespace qualifiers (see the 
# library file), generating erroneous wrapper code. The code is patched here.
$(PATCHED) : $(WRAPPER)
	cp $(WRAPPER) $(PATCHED)
	sed -i s/'operator const Float3\&'/'operator const Wm5::Float3\&'/g $(PATCHED)
	sed -i s/'operator Float3\&'/'operator Wm5::Float3\&'/g $(PATCHED)
	sed -i s/'operator const Vector3f\&'/'operator const Wm5::Vector3f\&'/g $(PATCHED)
	sed -i s/'operator Vector3f\&'/'operator Wm5::Vector3f\&'/g $(PATCHED)

$(WRAPPER) : $(INTERFACE)
	$(SWIG) $(SWIGOPTS) -I$(WM5INCDIR) -c++ -python -o $(WRAPPER) $(INTERFACE)

test :
	python test.py

clean :
	rm -f *.pyc *.so *_wrap* *.o wm5.py

# The end.
