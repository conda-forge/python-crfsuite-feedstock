import pytest
import os

exit(pytest.main(['-x', os.environ['SRC_DIR'] + '/tests', '--doctest-modules']))
