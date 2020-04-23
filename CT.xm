#import <CoreFoundation/CoreFoundation.h>
#import <CoreText/CoreText.h>
#import <substrate.h>

static CTLineRef (*orig_line)(CFAttributedStringRef string);
static CTLineRef ineffectify_line(CFAttributedStringRef string) {
	return ([[(__bridge NSAttributedString*)string string] containsString:@"بٍٍٍٍََُُُِّّّْرٍٍٍٍََُُِِّّّْآٍٍٍَُّ"]) ? orig_line(CFAttributedStringCreate(NULL, (__bridge CFStringRef)[[(__bridge NSAttributedString*)string string] stringByReplacingOccurrencesOfString:@"بٍٍٍٍََُُُِّّّْرٍٍٍٍََُُِِّّّْآٍٍٍَُّ" withString:@"❌REMOVED❌" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [[(__bridge NSAttributedString*)string string] length])], CFAttributedStringGetAttributes(string, 0, NULL))) : orig_line(string);
}

static CTFramesetterRef (*orig_frame)(CFAttributedStringRef string);
static CTFramesetterRef ineffectify_frame(CFAttributedStringRef string) {
	return ([[(__bridge NSAttributedString*)string string] containsString:@"بٍٍٍٍََُُُِّّّْرٍٍٍٍََُُِِّّّْآٍٍٍَُّ"]) ? orig_frame(CFAttributedStringCreate(NULL, (__bridge CFStringRef)[[(__bridge NSAttributedString*)string string] stringByReplacingOccurrencesOfString:@"بٍٍٍٍََُُُِّّّْرٍٍٍٍََُُِِّّّْآٍٍٍَُّ" withString:@"❌REMOVED❌" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [[(__bridge NSAttributedString*)string string] length])], CFAttributedStringGetAttributes(string, 0, NULL))) : orig_frame(string);
}

%ctor {
	MSHookFunction(CTLineCreateWithAttributedString, ineffectify_line, &orig_line);
	MSHookFunction(CTFramesetterCreateWithAttributedString, ineffectify_frame, &orig_frame);
}