# meta-my-layer/recipes-core/images/core-image-minimal.bbappend

DESCRIPTION = "Custom BeagleBone image with debugging tools"

# Add debugging and essential utilities
IMAGE_INSTALL:append = " util-linux-lsblk util-linux-fdisk util-linux-mount htop nano openssh "

# Optional: display banner during build
python do_display_banner() {
    bb.plain("***********************************************")
    bb.plain("*                                             *")
    bb.plain("*  Building Custom BeagleBone Yocto Image     *")
    bb.plain("*                                             *")
    bb.plain("***********************************************")
}

addtask display_banner before do_build
