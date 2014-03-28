actionlib
========

This wiki provides information about action lib messages for messaging move_base navigation component.

1. Cancel a given goal:

To cancel a given goal to the navigation stack:

		rostopic pub /move_base/cancel actionlib_msgs/GoalID -- {}