# meta-my-layer/recipes-core/images/core-test-image.bb
LICENSE = "CLOSED"

DESCRIPTION = "Custom BeagleBone image with debugging tools"

inherit core-image

# Add debugging and essential utilities
#IMAGE_INSTALL += "util-linux-lsblk"

# Optional: display banner during build
python do_display_banner() {
    bb.plain("***********************************************")
    bb.plain("*                                             *")
    bb.plain("*  Building Custom BeagleBone Yocto Image     *")
    bb.plain("*                                             *")
    bb.plain("***********************************************")
}

addtask display_banner before do_build
