################################################################################
#
# BPF Compiler Collection (BCC)
#
################################################################################

BCC_VERSION = v0.15.0
BCC_SITE = https://github.com/iovisor/bcc
BCC_SITE_METHOD = git
BCC_GIT_SUBMODULES = YES
BCC_LICENSE = Apache-2.0
BCC_LICENSE_FILES = LICENSE.txt
BCC_INSTALL_STAGING = YES
BCC_DEPENDENCIES = host-bison host-flex host-zlib zlib elfutils clang llvm

ifeq ($(BR2_PACKAGE_PYTHON),y)
BCC_DEPENDENCIES += python
else
BCC_DEPENDENCIES += python3
endif

BCC_CONF_OPTS += \
	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -isystem $(HOST_DIR)/include"

$(eval $(cmake-package))
