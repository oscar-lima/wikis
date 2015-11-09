#!/usr/bin/env python

from distutils.core import setup
from catkin_pkg.python_setup import generate_distutils_setup

# for your packages to be recognized by python
d = generate_distutils_setup(
    packages=['my_package_name', 'my_package_name_ros'], 
    package_dir={'my_package_name': 'common/src', 'my_package_name_ros': 'ros/src'}
)

setup(**d)
