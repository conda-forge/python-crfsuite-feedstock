@echo on

pushd pycrfsuite

del _pycrfsuite.cpp
if %errorlevel% neq 0 exit /b %errorlevel%

echo "# distutils: language = c++" > _pycrfsuite.pyx.tmp
type _pycrfsuite.pyx >> _pycrfsuite.pyx.tmp
move _pycrfsuite.pyx.tmp _pycrfsuite.pyx
cythonize _pycrfsuite.pyx
if %errorlevel% neq 0 exit /b %errorlevel%

dir

type _pycrfsuite.pyx

popd

%PYTHON% -m pip install -vvv .
if %errorlevel% neq 0 exit /b %errorlevel%
