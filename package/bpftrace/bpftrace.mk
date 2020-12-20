################################################################################
#
# bpftrace
#
################################################################################

# upcoming 0.12 version.
BPFTRACE_VERSION = 487dd815bfe4a24908950552f35ef17d6653b2f8
BPFTRACE_SITE = $(call github,iovisor,bpftrace,$(BPFTRACE_VERSION))
BPFTRACE_LICENSE = Apache-2.0
BPFTRACE_LICENSE_FILES = LICENSE
BPFTRACE_DEPENDENCIES = host-bison host-flex bcc libbpf llvm

# libbfd, libopcodes
ifeq ($(BR2_PACKAGE_BINUTILS),y)
BPFTRACE_DEPENDENCIES += binutils
endif

BPFTRACE_CONF_OPTS += -DENABLE_MAN=OFF

$(eval $(cmake-package))
