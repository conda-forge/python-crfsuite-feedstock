#!/usr/bin/env bash

set -euxo pipefail

rm pycrfsuite/_pycrfsuite.cpp

pushd pycrfsuite

echo "# distutils: language = c++"|cat - _pycrfsuite.pyx > _pycrfsuite.pyx.tmp
mv _pycrfsuite.pyx.tmp _pycrfsuite.pyx
cythonize _pycrfsuite.pyx

popd

"${PYTHON}" -m pip install -vvv . --no-deps --no-build-isolation --disable-pip-version-check
