################################################################################
#
# BPFTrace
#
################################################################################

BPFTRACE_VERSION = v0.11.0
BPFTRACE_SITE = https://github.com/iovisor/bpftrace
BPFTRACE_SITE_METHOD = git
BPFTRACE_LICENSE = Apache-2.0
BPFTRACE_LICENSE_FILES = LICENSE
BPFTRACE_INSTALL_STAGING = YES
BPFTRACE_DEPENDENCIES = bcc

BCC_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

$(eval $(cmake-package))
