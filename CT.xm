// Methods from IneffectivePower by angelXwind

#import <CoreFoundation/CoreFoundation.h>
#import <CoreText/CoreText.h>
#import <substrate.h>

static CTLineRef (*orig_line)(CFAttributedStringRef string);
static CTLineRef ineffectify_line(CFAttributedStringRef string) {
	NSString const *String = [(__bridge NSAttributedString*)string string];
	return ([String containsString:@"بٍٍٍٍََُُُِّّّْرٍٍٍٍََُُِِّّّْآٍٍٍَُّ"]) ? orig_line(CFAttributedStringCreate(NULL, (__bridge CFStringRef)[String stringByReplacingOccurrencesOfString:@"بٍٍٍٍََُُُِّّّْرٍٍٍٍََُُِِّّّْآٍٍٍَُّ" withString:@"Unsupported characters" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [String length])], CFAttributedStringGetAttributes(string, 0, NULL))) : orig_line(string);
}

static CTFramesetterRef (*orig_frame)(CFAttributedStringRef string);
static CTFramesetterRef ineffectify_frame(CFAttributedStringRef string) {
	NSString const *String = [(__bridge NSAttributedString*)string string];
	return ([String containsString:@"بٍٍٍٍََُُُِّّّْرٍٍٍٍََُُِِّّّْآٍٍٍَُّ"]) ? orig_frame(CFAttributedStringCreate(NULL, (__bridge CFStringRef)[String stringByReplacingOccurrencesOfString:@"بٍٍٍٍََُُُِّّّْرٍٍٍٍََُُِِّّّْآٍٍٍَُّ" withString:@"Unsupported characters" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [String length])], CFAttributedStringGetAttributes(string, 0, NULL))) : orig_frame(string);
}

%ctor {
	MSHookFunction(CTLineCreateWithAttributedString, ineffectify_line, &orig_line);
	MSHookFunction(CTFramesetterCreateWithAttributedString, ineffectify_frame, &orig_frame);
}
