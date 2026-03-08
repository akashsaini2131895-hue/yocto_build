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
  rm -rf $BUILD_DIR/cache
  rm -rf $BUILD_DIR/conf
  rm -rf $BUILD_DIR/tmp
}

clean

# update repo with latest menifest file
kas checkout $YOCTO_DIR/kas-beaglebone.yml

set +u
# source oe-init build environment
source $YOCTO_DIR/poky/oe-init-build-env $BUILD_DIR > /dev/null
set -u

bitbake core-image-minimal 

echo "build output present at : $BUILD_DIR/build/deploy/images/beaglebone-yocto"
