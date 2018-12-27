#!/bin/bash
###########################################
# Build Script                            #
# Flo Universal                           #
# Xcode 9.1+                              #
# hai@leftcoastlogic.com                  #
# QCRelease/Relase/AutomationDebug/AutomationRelease #
###########################################


configuration='Release'
provision="Flo_Universal_QC.mobileprovision"
identity="iPhone Distribution: Floware LLC (TL9V27BMW8)"
version="1.0"
build="1"
sdk="iphoneos"
scheme="DCFiOS"
exportOption="../build/export_ptions/$configuration.plist"
buildnotes="../build/notes/$configuration.txt"
tester_mailboxs="flouniversal@gmail.com"

if [[ "$configuration" == "Release" ]]; then
  provision="../build/provisionings/$configuration/Flo_Universal_QC.mobileprovision"
  tester_mailboxs="haithngn@gmail.com"
fi

echo "$provision" "$configuration"

archivePath="../build/archives/$scheme.$version.$build.$configuration.xcarchive"
output="../build/output/binaries/$scheme.$version.$build.$configuration"
builddir="../build/output/builddir/$scheme.$version.$build.$configuration"

echo "Cleaning up old build..."
rm -Rf "$PWD/build/$configuration-$sdk"

echo "Building $scheme, using $configuration configuration, provisioning = $provision"

if  [[ "$configuration" == "AutomationDebug" ]]; then
  xcodebuild -scheme "$scheme" -sdk "$sdk" -archivePath "$archivePath" -configuration "$configuration" PROVISIONING_PROFILE="$provision" CONFIGURATION_BUILD_DIR="$builddir"
elif [[ "$configuration" == "AutomationRelease" ]]; then
  xcodebuild -scheme "$scheme" -sdk "$sdk" -archivePath "$archivePath" -configuration "$configuration" PROVISIONING_PROFILE="$provision" CONFIGURATION_BUILD_DIR="$builddir"
else
  xcodebuild -scheme "$scheme" -sdk "$sdk" -archivePath "$archivePath" -configuration "$configuration" PROVISIONING_PROFILE="$provision" CONFIGURATION_BUILD_DIR="$builddir" archive
  echo "exporting..............."
  xcodebuild -exportArchive -archivePath "$archivePath" -exportOptionsPlist "$exportOption" -exportPath "$output"
fi

if [[ ("$configuration" == "AutomationDebug") || ("$configuration" == "AutomationRelease") ]]; then
  if [ -d "$builddir/$scheme.app" ]; then
    echo "Exporting app file for Automation Environment"
    echo "zipping... the app"
    if [[ ("$configuration" == "AutomationDebug") ]]; then
      zip -r "$builddir/$scheme.$version.$build.$configuration.Simulator.zip" "$builddir/$scheme.app"
      curl -F file=@"$builddir/$scheme.$version.$build.$configuration.Simulator.zip" -F title="$scheme.$version.$build.Automation.Simulator.zip" -F filename="$scheme.$version.$build.Automation.Simulator.zip" -F channels=#general -F token=xoxp-186550275043-187447070119-255877486165-8a38504cc070664b644cbb957ce69dd9 https://slack.com/api/files.upload
    elif  [[ ("$configuration" == "AutomationRelease") ]]; then
      zip -r "$builddir/$scheme.$version.$build.$configuration.iOSDevice.zip" "$builddir/$scheme.app"
      curl -F file=@"$builddir/$scheme.$version.$build.$configuration.iOSDevice.zip" -F title="$scheme.$version.$build.Automation.iOSDevice.zip" -F filename="$scheme.$version.$build.Automation.iOSDevice.zip" -F channels=#general -F token=xoxp-186550275043-187447070119-255877486165-8a38504cc070664b644cbb957ce69dd9 https://slack.com/api/files.upload
    fi
    osascript -e 'display notification "Flo Universal Automation" with title "🐳 Upload App file to Slack successfully"'
  else
    osascript -e 'display notification "Flo Universal Automation" with title "😂 Failed, the App file could not be found"'
  fi
else
  if [ -f "$output/$scheme.ipa" ]; then
    if [[ "$configuration" != "Production" ]]; then
      echo "Uploading $output/$scheme.ipa to Fabric.io..."
      echo "./Flo/Platforms/ios/Frameworks/Crashlytics.framework/submit $crashlytics_api_key $crashlytics_build_secret -ipaPath ""$output/$scheme.ipa"""

      echo "Copying...$builddir/$scheme.app.dSYM to $output"
      echo $builddir
      cp -r "$builddir/$scheme.app.dSYM" $output

      echo "$scheme has been deploy to Fabric!"
      echo "Upload dSYM File..."

      echo "Upload IPA File..."
      cp "$output/$scheme.ipa" "$output/$scheme.$configuration.$version.$build.ipa"
      curl -F file=@"$output/$scheme.$configuration.$version.$build.ipa" -F title="$scheme.$configuration.$version.$build.ipa" -F filename="$scheme.$configuration.$version.$build.ipa" -F channels=#general -F token=xoxp-186550275043-187447070119-255877486165-8a38504cc070664b644cbb957ce69dd9 https://slack.com/api/files.upload
      rm -f "$output/$scheme.ipa"
      osascript -e 'display notification "Flo Universal" with title "🐳 Uploaded IPA"'

      #curl -X POST -H 'Content-type: application/json' --data '{"text":"🐳🐳🐳 Captain! The Flo Universal has been successfully deployed via Fabric.io. 🚀🚀🚀 Scheme: '$scheme' Environment: '$configuration' version:'$version' build:'$build'"}' https://hooks.slack.com/services/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
    else
      echo "Upload IPA File to Test Flight..."
    fi
  else
    echo "Build Failed"
    osascript -e 'display notification "Flo Universal" with title "😂 Build Failed!"'
    curl -X POST -H 'Content-type: application/json' --data '{"text":"😂 😂 😂 Captain! The build is failed. 🚀🚀🚀 Scheme: '$scheme' Environment: '$configuration' version:'$version' build:'$build'"}' https://hooks.slack.com/services/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
  fi
fi
