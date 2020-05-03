// Methods from IneffectivePower by angelXwind
// Made CF-only by PoomSmart because he doesn't trust ARC

#import <CoreFoundation/CoreFoundation.h>
#import <CoreText/CoreText.h>
#import <substrate.h>

CFStringRef sindhi = CFSTR("بٍٍٍٍََُُُِّّّْرٍٍٍٍََُُِِّّّْآٍٍٍَُّ");
CFIndex sindhiLength = CFStringGetLength(sindhi); // 37
CFStringRef replace = CFSTR("Unsupported characters..............."); // length also 37

%hookf(CTLineRef, CTLineCreateWithAttributedString, CFAttributedStringRef attrString) {
	if (attrString != NULL) {
		CFStringRef string = CFAttributedStringGetString(attrString);
		if (string != NULL) {
			CFIndex stringLength = CFStringGetLength(string);
			if (stringLength >= sindhiLength) {
				CFArrayRef targets = CFStringCreateArrayWithFindResults(kCFAllocatorDefault, string, sindhi, CFRangeMake(0, stringLength), kCFCompareCaseInsensitive);
				if (targets != NULL) {
					CFMutableAttributedStringRef mutableAttrString = CFAttributedStringCreateMutableCopy(kCFAllocatorDefault, stringLength, attrString);
					CFIndex size = CFArrayGetCount(targets);
					CFAttributedStringBeginEditing(mutableAttrString);
					for (CFIndex i = 0; i < size; ++i) {
						CFRange *range = (CFRange *)CFArrayGetValueAtIndex(targets, i);
						CFAttributedStringReplaceString(mutableAttrString, *range, replace);
					}
					CFAttributedStringEndEditing(mutableAttrString);
					CFRelease(targets);
					return %orig(mutableAttrString);
				}
			}
		}
	}
	return %orig(attrString);
}

%hookf(CTFramesetterRef, CTFramesetterCreateWithAttributedString, CFAttributedStringRef attrString) {
	if (attrString != NULL) {
		CFStringRef string = CFAttributedStringGetString(attrString);
		if (string != NULL) {
			CFIndex stringLength = CFStringGetLength(string);
			if (stringLength >= sindhiLength) {
				CFArrayRef targets = CFStringCreateArrayWithFindResults(kCFAllocatorDefault, string, sindhi, CFRangeMake(0, stringLength), kCFCompareCaseInsensitive);
				if (targets != NULL) {
					CFMutableAttributedStringRef mutableAttrString = CFAttributedStringCreateMutableCopy(kCFAllocatorDefault, stringLength, attrString);
					CFIndex size = CFArrayGetCount(targets);
					CFAttributedStringBeginEditing(mutableAttrString);
					for (CFIndex i = 0; i < size; ++i) {
						CFRange *range = (CFRange *)CFArrayGetValueAtIndex(targets, i);
						CFAttributedStringReplaceString(mutableAttrString, *range, replace);
					}
					CFAttributedStringEndEditing(mutableAttrString);
					CFRelease(targets);
					return %orig(mutableAttrString);
				}
			}
		}
	}
	return %orig(attrString);
}

%ctor {
	%init;
}
