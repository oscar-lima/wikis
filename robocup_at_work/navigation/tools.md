Navigation tools
================

1. calling the service to create a plan without executing

rosservice call /move_base/NavfnROS/make_plan "start:
  header:
    seq: 0
    stamp:
      secs: 0
      nsecs: 0
    frame_id: 'map'
  pose:
    position:
      x: 0.0
      y: 0.0
      z: 0.0
    orientation:
      x: 0.0
      y: 0.0
      z: 0.0
      w: 1.0
goal:
  header:
    seq: 0
    stamp:
      secs: 10
      nsecs: 0
    frame_id: 'map'
  pose:
    position:
      x: 1.479
      y: -1.187
      z: 0.0
    orientation:
      x: 0.0
      y: 0.0
      z: -0.401
      w: 0.916
tolerance: 0.1"

2. clearing the costmap

		rosservice call /move_base/clear_costmaps
		
3. Cancelling goal

		rostopic pub /move_base/cancel actionlib_msgs/GoalID -- {}