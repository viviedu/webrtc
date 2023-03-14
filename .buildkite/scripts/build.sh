#!/bin/bash

gclient config --unmanaged --spec "solutions=[{\"name\":\"src\",\"url\":\"${BUILDKITE_REPO}@origin/${BUILDKITE_BRANCH}\"}]"
gclient sync --deps=ios,mac --no-history --shallow
cd src
tools_webrtc/ios/build_ios_libs.py --arch arm64 --extra-gn-args rtc_enable_protobuf=false treat_warnings_as_errors=false
cd out_ios_libs
mkdir -p ../../artifacts
zip -r -y ../../artifacts/WebRTC.framework.zip WebRTC.framework
