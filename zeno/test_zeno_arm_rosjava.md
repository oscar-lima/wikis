Test zeno with rosjava
======================

0. Make (if needed)

		cd ~/ros_ws/rosjava_ws
		catkin_make

1. Run zeno avatar:

		cd /home/oscar/Documents/emo_robot/zeno/avatar_zeno_simulation/hrk_standalone_avatar_src_20130430_015_02
		mvn -Prun-on-felix package antrun:run

2. Run qpid server:

		qpid-server

3. Run roscore

		roscore

4. Run the listener:

		cd ~/ros_ws/rosjava_ws/src/zeno/pub_sub/build/install/pub_sub/bin
		./pub_sub com.github.zeno.pub_sub.Listener

5. Hear for the chatter topic to confirm the publication of the talker

		rostopic echo /chatter

6. Run the talker:

		cd /home/oscar/ros_ws/rosjava_ws/src/zeno/pub_sub/build/install/pub_sub/bin
		./pub_sub com.github.zeno.pub_sub.Talker

Ready, now zeno should move the right arm