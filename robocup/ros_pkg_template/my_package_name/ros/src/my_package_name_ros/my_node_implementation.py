#!/usr/bin/env python
import rospy
import sys
import pddl
import my_package_name.my_generic_util_class as utils

"""
my node brief explanation
"""

def my_function(a, b, c):
    """
    my function explanation:
    calls a+b and adds c, send the result a+b+c
    """
    a_plus_b = utils.my_generic_sum_function(a, b)
    return a_plus_b + c
    

def main():
    rospy.init_node('my_node_name')
    a, b, c = 1, 2, 3
    result = my_function(a, b, c)
    rospy.loginfo('Node my_node_name started')
    rospy.loginfo('result = {0}'.format(result))
    