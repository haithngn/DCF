report="../build/tests/tests.log"
scheme=$1
testscheme=$2
device_instance=$3
xcodebuild -project DCFiOS.xcodeproj -scheme $scheme -sdk $device_instance build-for-testing
echo "testing..."
xctool -project DCFiOS.xcodeproj -scheme $testscheme -launch-timeout 3600 -sdk $device_instance run-tests -reporter plain:$report
echo $report
cat $report
curl -F file=@"$report" -F title="DCFiOS_Unit_Testing_Report.txt" -F filename="$report" -F channels=#tests -F token=xoxp-186550275043-187447070119-255877486165-8a38504cc070664b644cbb957ce69dd9 https://slack.com/api/files.upload
echo "reported"
