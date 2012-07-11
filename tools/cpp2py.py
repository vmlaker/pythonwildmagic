"""Methods used in translation of C++ to Python."""

import wm5


# A table of text replacements int C++ names to create legitimate Python names.
REPLACEMENTS = (
    ('<2, Wm5::Vector2<float>, Wm5::Vector2<double> >' , '2'),
    ('<3, Wm5::Vector3<float>, Wm5::Vector3<double> >' , '3'),
    ('<double, Wm5::Vector2<double> >' , '2d'),
    ('<double, Wm5::Vector3<double> >' , '3d'),
    ('<float, Wm5::Vector2<float> >'   , '2f'),
    ('<float, Wm5::Vector3<float> >'   , '3f'),
    ('<Wm5::EdgeKey, float>', 'EdgeKeyf'),
    ('<Wm5::Echar>'  , 'Echar'),
    ('<Wm5::Edouble>', 'Edouble'),
    ('<Wm5::Efloat>' , 'Efloat'),
    ('<Wm5::Eint>'   , 'Eint'),
    ('<Wm5::Elong>'  , 'Elong'),
    ('<Wm5::Ergb5>'  , 'Ergb5'),
    ('<Wm5::Ergb8>'  , 'Ergb8'),
    ('<Wm5::Eshort>' , 'Eshort'),
    ('<Wm5::Euchar>' , 'Euchar'),
    ('<Wm5::Euint>'  , 'Euint'),
    ('<Wm5::Eulong>' , 'Eulong'),
    ('<Wm5::Eushort>', 'Eushort'),
    ('<3, 3, float>', '33f'),
    ('<int, float>' , 'if'),
    ('<1, int>'   , '1i'),
    ('<1, float>' , '1f'),
    ('<2, int>'   , '2i'),
    ('<2, float>' , '2f'),
    ('<3, int>'   , '3i'),
    ('<3, float>' , '3f'),
    ('<4, int>'   , '4i'),
    ('<4, float>' , '4f'),
    ('<double>'   , 'd'),
    ('<float>'    , 'f'),
    ('<int>'      , 'i'),
    ('<2>' , '2'),
    ('<3>' , '3'),
    ('<4>' , '4'),
    ('<5>' , '5'),
    ('<6>' , '6'),
    ('Pointer0<Wm5::', 'Pointer0'),
    ('Wm5::', 'wm5.'),
    ('::', '.'),
    ('>', ''),
    )


def compare(in_file):
    """Return (cpp_names, py_names, cpp_in_py, py_in_cpp)."""
    # Read the input file of C++ names.
    fin = open(in_file)
    lines = fin.readlines()
    fin.close()

    # Assemble a lookup table that maps original C++ names
    # to their Python equivalents.
    cpp2py_names = {}
    for cpp_name in lines:
        cpp_name = cpp_name.strip()
        py_name = getPyName(cpp_name)
        cpp2py_names[cpp_name] = py_name

    # Assemble a lookup table that maps Python equivalent 
    # names to their original C++ names.
    py2cpp_names = {}
    for cpp_name in lines:
        cpp_name = cpp_name.strip()
        py_name = getPyName(cpp_name)
        py2cpp_names[py_name] = cpp_name

    # Assemble a lookup table of names found in the Python module.
    py_names = {}
    for name in sorted(dir(wm5)):
        name = 'wm5.%s'%name
        # Skip names that have swigregister stuff in em.
        SREG = '_swigregister'
        if name[len(name) - len(SREG):] == SREG:
            continue
        py_names[name] = None

    # Match Python equivalents (of C++) to names in Python module.
    cpp_in_py = {}
    for name in py2cpp_names.keys():
        if name in py_names:
            cpp_in_py[name] = None

    # Match names in Python module to Python equivalents (of C++).
    py_in_cpp = {}
    for name in py_names.keys():
        if name in py2cpp_names:
            py_in_cpp[name] = None

    return (cpp2py_names,
            py_names,
            cpp_in_py,
            py_in_cpp,
            )


def getPyName(cpp_name):
    """Given a C++ name, return equivalent Python name."""
    result = cpp_name
    for old,new in REPLACEMENTS:
        result = result.replace(old, new)
    return result


# The end.
