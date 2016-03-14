testing smart lab move away from obstacle recovery behavior
===========================================================

This wiki explains how to test smart lab recovery behavior for the mobile base.
It moves away from obstacles by computing a force field vector

1. Checkout slaw_navigation branch under mas_industrial_robotics and compile

(Currently only under oscar-lima fork)

2. Launch the following components:

		roscore
		bringup_sim
		roslaunch slaw_registration icp.launch
		rviz

3. Call the service for activating the force field

		rosservice call /scan_registration/switchOffForcefield "pause: true"

4. Watch in rviz how the youbot moves away from obstacles

5. Stop the service

		rosservice call /scan_registration/switchOffForcefield "pause: false"

Done!

Now youbot should move away from obstacles when the service is called