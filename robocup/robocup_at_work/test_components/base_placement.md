base placement
==============

Base placemente is a component that aligns the base towards a vertical surface.

1. Takes input from laser scanner
2. fits a line to the points
3. aligns the base to the previous calculated line by sending velocity commands to the mobile base

test
====

1. bringup the robot:

on the real robot:

		roslauch mir_bringup robot.launch

on simulation:

		roslaunch mir_bringup_sim robot.launch
		
2. Launch base placement component:

		roslaunch mir_base_placement base_placement.launch

3. trigger the alignment

		rosrun mir_base_placement basescan_orientation_test 0.2

Done! now the mobile base should align 20 cm away from the platform (or vertical surface)