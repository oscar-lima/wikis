run openni tracker
==================

Documentation available at:

		http://wiki.ros.org/openni_tracker
		http://answers.ros.org/question/128116/openni_tracker-find-user-generator-failed-cant-create-any-node-of-the-requested-type/

1. Run roscore

		roscore

2. Run openni.launch

		roslaunch openni_launch openni.launch

3. Run rviz

		rosrun rviz rviz

4. Run the openni tracker

		rosrun openni_tracker openni_tracker

5. Surrender in Pi position (see website ros documentation)


Done! now you should be able to track your skeleton with rviz and tf (add tf topic to rviz)