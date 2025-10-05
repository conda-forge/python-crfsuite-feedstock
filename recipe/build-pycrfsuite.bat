@echo on

pushd pycrfsuite

del _pycrfsuite.cpp || exit 2
(echo # distutils: language = c++) > _pycrfsuite.pyx.tmp
type _pycrfsuite.pyx >> _pycrfsuite.pyx.tmp
move _pycrfsuite.pyx.tmp _pycrfsuite.pyx
cythonize _pycrfsuite.pyx || exit 3

popd

"%PYTHON%" -m pip install -vvv . --no-deps --no-build-isolation --disable-pip-version-check || exit 4
