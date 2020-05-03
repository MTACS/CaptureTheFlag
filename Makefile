THEOS_DEVICE_UP = 192.168.1.3

ARCHS = arm64 arm64e

FINALPACKAGE = 1

DEBUG = 0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CaptureTheFlagCT

CaptureTheFlagCT_FILES = CT.xm
CaptureTheFlagCT_FRAMEWORKS = CoreText CoreFoundation

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "sbreload"
