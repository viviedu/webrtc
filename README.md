# WebRTC iOS SDK

## Building
```
gclient config --unmanaged --spec 'solutions=[{"name":"src","url":"https://github.com/viviedu/webrtc.git@origin/vivi"}]'
gclient sync --deps=ios,mac --no-history --shallow
cd src
tools_webrtc/ios/build_ios_libs.py --arch arm64 --extra-gn-args rtc_enable_protobuf=false treat_warnings_as_errors=false
```
