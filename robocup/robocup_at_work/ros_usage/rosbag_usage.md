rosbag usage
============

This wiki explains how to use rosbag as a topic recorder for the ros interface

bag - what is a bag? : A bag is a ros topic recorded in a file with an

associated time.

It is usefull in research and allows to record the behaviour of the robot

and replicate this behaviour several times

1. record a topic

		rosbag record /topic_name

2. record all topics

		rosbag record -a

3. play created bag

		rosbag play name_of_the_bag

4. To allow the publishing of clock comming from the bag

/use_sim_time parameters must be set to true before

		rosbag play xxx --clock

NOTES:

Sometimes only roscore and the bag is sufficient to view your results
specially if you recorded all topics

Done! by now you should be able to record and play bags in ros.