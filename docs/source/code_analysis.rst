.. _code_analysis:

*************
Code Analysis
*************

To determine the Python extension module's breadth of coverage 
of the C++ code, you can run analysis
tools found in the ``tools/`` directory. You need
*GCC-XML* on your system for this to work (APT or YUM 
users can simply install package ``gccxml``.) The following
steps run the analysis tools, with intermediate files
saved in ``out/`` subdirectory.

#. Generate XML description of the C++ code:
   ::
  
     tools/gen-xml.py out/xml `./config.py`

#. Parse the generated XML files to obtain a list of class names:
   ::

     tools/parse-xml.py out/cpp.txt out/xml/*

#. Compare class names found in the C++ namespace with
   names in the Python extension module:
   ::

     tools/compare.py out/cpp.txt

.. The end.
