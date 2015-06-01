#common ros alias

#alias
alias rviz='rosrun rviz rviz'
alias reconfigure='rosrun rqt_reconfigure rqt_reconfigure'
alias rqt_graph='rosrun rqt_graph rqt_graph'

#print severity and node name before console output (ROS_INFO, ROS_ERROR etc.)
export ROSCONSOLE_FORMAT='[${severity}] [${node}]: ${message}'
