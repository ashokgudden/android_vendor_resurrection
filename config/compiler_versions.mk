# Written for UBER toolchains (UBERTC)
# Requires a Linux Host

UNAME := $(shell uname -s)
ifeq (Linux,$(UNAME))
  HOST_OS := linux
endif

ifeq (linux,$(HOST_OS))
  AND_SDCLANG_VERSION := $(shell vendor/qcom/sdclang-3.8/linux-x86/bin/clang --version | grep "Snapdragon " 2>&1 | cut -d' ' -f 1,5)

  space :=
  space +=
  AND_SDCLANG_VERSION := $(subst $(space),-,$(strip $(AND_SDCLANG_VERSION)))

  ADDITIONAL_BUILD_PROPERTIES += \
    ro.build.fusion.sdclang=$(AND_SDCLANG_VERSION)
endif
