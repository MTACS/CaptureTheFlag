THEOS_DEVICE_IP = 192.168.1.3

ARCHS = arm64 arm64e

FINALPACKAGE = 1

DEBUG = 0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CaptureTheFlagCT CaptureTheFlagSB

CaptureTheFlagCT_FILES = CT.xm
CaptureTheFlagCT_CFLAGS = -fobjc-arc
CaptureTheFlagCT_FRAMEWORKS = CoreText CoreFoundation

CaptureTheFlagSB_FILES = SB.xm
CaptureTheFlagSB_CFLAGS = -fobjc-arc
CaptureTheFlagSB_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "sbreload"
