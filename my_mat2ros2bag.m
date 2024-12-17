bagWriter = ros2bagwriter("bag_files4/my_bag_file4");

for i=1:4501
    message2 = ros2message("geometry_msgs/TwistStamped");
    message2.header.stamp.sec=int32(tt(i));
    message2.header.stamp.nanosec=uint32((tt(i)-fix(tt(i)))*10^9);
    message2.twist.linear.x=vv(i);
    message2.twist.angular.z=ref_m(i,2);
%    write(bagWriter, "MotionPlanning", ros2time(message2.header.stamp.sec,message2.header.stamp.nanosec),message2);
    write(bagWriter, "MotionPlanning", ros2time(tt(i)),message2);
end
delete(bagWriter);