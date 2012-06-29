# The following assumes code analysis had been run
# and the output file saved as ../out/cpp.txt

echo `./get-coverage.py ../out/cpp.txt` > source/coverage.rst
echo \*\(`date +'%A, %B %e, %Y'`\.\)\* >> source/coverage.rst
echo `../tools/get-table.py ../out/cpp.txt` > source/names_table.html
make BUILDDIR=../../doc html
./prune.py ../../doc
