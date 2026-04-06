#!/usr/bin/env bash

set -euo pipefail

CURRENT_DIR="$PWD"
YOCTO_DIR="$CURRENT_DIR/../"
BUILD_DIR="$YOCTO_DIR/build"

echo "Current Dir:- $CURRENT_DIR"
echo "Yocto Dir:- $YOCTO_DIR"
echo "Build Dir:- $BUILD_DIR"

cd $YOCTO_DIR

# Clean old build artifact
clean() {
  echo "Clean build artifact"
  rm -rf $BUILD_DIR
  #rm -rf $BUILD_DIR/tmp
  #rm -rf $BUILD_DIR/cache
}

clean

# update repo with latest menifest file
repo init -u https://github.com/akashsaini2131895-hue/menifest.git -b main -m test_menifest.xml
repo sync

export TEMPLATECONF=$YOCTO_DIR/meta-my-layer/conf/templates/default

set +u
# source oe-init build environment
source $YOCTO_DIR/poky/oe-init-build-env $BUILD_DIR > /dev/null
set -u

bitbake core-test-image 

echo "build output present at : $BUILD_DIR/build/deploy/images/beaglebone-yocto"
