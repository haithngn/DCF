
#!/bin/bash
###########################################
# Build Script                            #
# Flo Universal                           #
# Xcode 9.1+                              #
# hai@leftcoastlogic.com                  #
# QCRelease/Relase/AutomationDebug/AutomationRelease #
###########################################


configuration='Release'
provision="Flo_Universal_Staging_Provisioning.mobileprovision"
identity="Mac Developer: Flo iOS InApp-Purchase Hai (E98DVD9DF3)"
configuration=$1
version=$2
build=$3
sdk="macos"
scheme="DCFOSX"
exportOption="../build/export_ptions/$configuration.plist"
buildnotes="../build/notes/$configuration.txt"

archivePath="../build/archives/$scheme.$version.$build.$configuration.xcarchive"
output="../build/output/binaries/$scheme.$version.$build.$configuration"
builddir="../build/output/builddir/$scheme.$version.$build.$configuration"

echo "Cleaning up old build..."
rm -Rf "$PWD/build/$configuration-$sdk"

echo "Building $scheme, using $configuration configuration, provisioning = $provision"

xcodebuild -scheme "$scheme" -sdk "$sdk" -archivePath "$archivePath" -configuration "$configuration" PROVISIONING_PROFILE="$provision" CONFIGURATION_BUILD_DIR="$builddir" archive
echo "exporting..............."
xcodebuild -exportArchive -archivePath "$archivePath" -exportOptionsPlist "$exportOption" -exportPath "$output"
