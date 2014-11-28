Test mir scenarios without referee box
======================================

This wiki will help to launch tests such as BNT or BTT without referee box pc.

1. modify the harcoded string accordingly:
(for robocup competition)

		nano /home/oscar/ros_ws/rockin/src/mas_industrial_robotics/mir_scenarios/mir_states/ros/src/mir_states/robocup/referee_box_states.py

(for rockin competition)

		nano /home/oscar/ros_ws/rockin/src/mas_industrial_robotics/mir_scenarios/mir_states/ros/src/mir_states/robocup/referee_box_states.py

2. modify line 47 accordingly

3. run the state machine with flag no refbox

		rosrun mir_basic_transportation_test basic_transportation_test --no-refbox

Done!

Now you should be able to run the tests without referee box

