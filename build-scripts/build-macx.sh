#!/bin/sh

fail()
{
    echo "$1" 1>&2
    exit 1
}

# Fail early if environment not set
[ -z "$BUILD_QT_PATH" ] && fail "BUILD_QT_PATH has to be set"
[ -z "$BUILD_ARCHIVE_NAME" ] && fail "BUILD_ARCHIVE_NAME has to be set"
[ -z "$BUILD_PARALLEL_THREADS" ] && fail "BUILD_PARALLEL_THREADS has to be set"

# Clean and enter shadow build folder
echo Cleaning...
if [ -e ../build ]; then
    rm -Rf ../build || fail "Could not delete ../build"
fi

mkdir ../build || fail "Could not create ../build"
cd ../build || fail "Could not enter ../build"

# Run qmake
echo Running qmake...
"$BUILD_QT_PATH/qmake" ../src/Solution.pro -r -spec macx-clang "CONFIG+=release" "CONFIG+=x86_64" "QMAKE_LFLAGS_SONAME=-Wl,-install_name,@executable_path/../Frameworks/" || fail "qmake failed"

# Run make using the number of hardware threads in BUILD_PARALLEL_THREADS
echo Building...
export MAKE_COMMAND="make -j$BUILD_PARALLEL_THREADS"
/usr/bin/time make || fail "make failed"

# Copy compiled binaries
echo Copying binaries...
mkdir -p "Shell/shell.app/Contents/Frameworks" || fail "Could not create Shell/shell.app/Contents/Frameworks"
find . -not \( -path ./Shell/shell.app/Contents/Frameworks -prune \) -name \*.dylib\* -exec cp -RfP {} "Shell/shell.app/Contents/Frameworks" \; || fail "Could not copy client libraries"

# Copy binary dependencies
echo Copying binary dependencies...
cp -RfP ../deploy/macx/MacOS "Shell/shell.app/Contents" || fail "Could not copy binary dependencies"

# Create app bundle
echo Creating app bundle...
"$BUILD_QT_PATH/macdeployqt" Shell/shell.app -libpath=../deploy/macx/Frameworks

# Copy Info.plist
echo Copying Info.plist...
cp -RfP ../deploy/macx/Info.plist "Shell/shell.app/Contents" || fail "Could not copy Info.plist"

# Create client folder to later dmg
export CLIENT_FOLDER="CasparCG Client"
if [ -f "$CLIENT_FOLDER" ]; then
    rm -Rf "$CLIENT_FOLDER" || fail "Could not delete $CLIENT_FOLDER"
fi
mkdir "$CLIENT_FOLDER" || fail "Could not create $CLIENT_FOLDER"

# Copy app bundle
mv Shell/shell.app "$CLIENT_FOLDER/$CLIENT_FOLDER.app" || fail "Could not move app bundle"

# Copy documentation
echo Copying documentation...
cp -f ../CHANGELOG "$CLIENT_FOLDER/" || fail "Could not copy CHANGELOG"
cp -f ../LICENSE "$CLIENT_FOLDER/" || fail "Could not copy LICENSE"

# Create dmg file
echo Creating dmg...
hdiutil create -size "$BUILD_HDIUTILS_WORKAROUND_SIZE" -volname "$CLIENT_FOLDER" -srcfolder "$CLIENT_FOLDER" -ov -format UDZO "$BUILD_ARCHIVE_NAME.dmg" || fail "Could not create dmg"

