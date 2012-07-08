# The following assumes code analysis had been run
# and the output file saved as ../out/cpp.txt

# Create the coverage string and the table of class names.
../tools/get-blurb.py ../out/cpp.txt > source/blurb.rst
../tools/get-table.py ../out/cpp.txt > source/names_table.html

# Build the documentation pages.
make BUILDDIR=../../doc html

# Get rid of unneeded documentation stuff.
./prune.py ../../doc
