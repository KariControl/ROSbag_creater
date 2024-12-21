%% テスト用入力信号の生成
tt=0:0.01:20;
f=0.1;
y1=sin(tt*2*pi*f);
y2=cos(tt*2*pi*f);

%% ROSbagへの変換処理
bagWriter = ros2bagwriter("bag_files4/my_bag_file4");% ROSbagオブジェクト生成

for i=1:length(y1)
    message2 = ros2message("geometry_msgs/TwistStamped");% メッセージ型定義
    message2.header.stamp.sec=int32(tt(i));% タイムスタンプ打刻
    message2.header.stamp.nanosec=uint32((tt(i)-fix(tt(i)))*10^9);% タイムスタンプ打刻
    message2.twist.linear.x=y1(i);
    message2.twist.linear.y=y2(i);
    write(bagWriter, "/matlab/control", ros2time(tt(i)),message2);% データ書き込み
end
delete(bagWriter);% オブジェクト削除によるメタデータ生成
