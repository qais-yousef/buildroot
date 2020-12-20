################################################################################
#
# bcc
#
################################################################################

BCC_VERSION = v0.17.0
BCC_SITE = https://github.com/iovisor/bcc.git
BCC_SITE_METHOD = git
BCC_GIT_SUBMODULES = YES
BCC_LICENSE = Apache-2.0
BCC_LICENSE_FILES = LICENSE.txt
# libbcc.so and libbcc_bpf.so
BCC_INSTALL_STAGING = YES
BCC_DEPENDENCIES = host-bison host-flex clang elfutils flex llvm python3 tar

# ENABLE_LLVM_SHARED=ON to use llvm.so.
# Force REVISION otherwise bcc will use git describe to generate a version number.
BCC_CONF_OPTS = -DENABLE_LLVM_SHARED=ON \
	-DREVISION=$(BCC_VERSION) \
	-DENABLE_CLANG_JIT=ON \
	-DENABLE_MAN=OFF \
	-DENABLE_LUAJIT=OFF

define BCC_LINUX_CONFIG_FIXUPS
	# Enable kernel support for eBPF
	$(call KCONFIG_ENABLE_OPT,CONFIG_BPF)
	$(call KCONFIG_ENABLE_OPT,CONFIG_BPF_SYSCALL)
	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_CLS_BPF)
	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_ACT_BPF)
	$(call KCONFIG_ENABLE_OPT,CONFIG_BPF_JIT)
	# [for Linux kernel versions 4.1 through 4.6]
	$(call KCONFIG_ENABLE_OPT,CONFIG_HAVE_BPF_JIT)
	# [for Linux kernel versions 4.7 and later]
	$(call KCONFIG_ENABLE_OPT,CONFIG_HAVE_EBPF_JIT)
	$(call KCONFIG_ENABLE_OPT,CONFIG_BPF_EVENTS)
	# [for Linux kernel versions 5.2 and later]
	$(call KCONFIG_ENABLE_OPT,CONFIG_IKHEADERS)
	# bcc needs debugfs at runtime
	$(call KCONFIG_ENABLE_OPT,CONFIG_DEBUG_FS)
endef

$(eval $(cmake-package))
