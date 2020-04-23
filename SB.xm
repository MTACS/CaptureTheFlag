%hook UILabel

- (void)setText:(NSString *)arg1 {

    if ([arg1 isEqualToString:@"بٍٍٍٍََُُُِّّّْرٍٍٍٍََُُِِّّّْآٍٍٍَُّ🇮🇹 بٍٍٍٍََُُُِّّّْرٍٍٍٍََُُِِّّّْآٍٍٍَُّ🇮🇹"] || [arg1 containsString:@"بٍٍٍٍََُُُِّّّْرٍٍٍٍََُُِِّّّْآٍٍٍَُّ🇮🇹 بٍٍٍٍََُُُِّّّْرٍٍٍٍََُُِِّّّْآٍٍٍَُّ🇮🇹"]) {

        %orig(@"❌Removed❌");

    }

    %orig;

}

- (NSString *)text {

    if ([%orig isEqualToString:@"بٍٍٍٍََُُُِّّّْرٍٍٍٍََُُِِّّّْآٍٍٍَُّ🇮🇹 بٍٍٍٍََُُُِّّّْرٍٍٍٍََُُِِّّّْآٍٍٍَُّ🇮🇹"] || [%orig containsString:@"بٍٍٍٍََُُُِّّّْرٍٍٍٍََُُِِّّّْآٍٍٍَُّ🇮🇹 بٍٍٍٍََُُُِّّّْرٍٍٍٍََُُِِّّّْآٍٍٍَُّ🇮🇹"]) {

        return @"❌Removed❌";
            
    }

    return %orig;

}

%end

%hook NSAttributedString

- (NSString *)string {

    if ([%orig isEqualToString:@"بٍٍٍٍََُُُِّّّْرٍٍٍٍََُُِِّّّْآٍٍٍَُّ🇮🇹 بٍٍٍٍََُُُِّّّْرٍٍٍٍََُُِِّّّْآٍٍٍَُّ🇮🇹"] || [%orig containsString:@"بٍٍٍٍََُُُِّّّْرٍٍٍٍََُُِِّّّْآٍٍٍَُّ🇮🇹 بٍٍٍٍََُُُِّّّْرٍٍٍٍََُُِِّّّْآٍٍٍَُّ🇮🇹"]) {

        return @"❌Removed❌";
            
    }

    return %orig;

}

%end

%hook NCNotificationContentView

- (void)setSecondaryText:(NSString *)arg1 {

    if ([arg1 containsString:@"بٍٍٍٍََُُُِّّّْرٍٍٍٍََُُِِّّّْآٍٍٍَُّ🇮🇹 بٍٍٍٍََُُُِّّّْرٍٍٍٍََُُِِّّّْآٍٍٍَُّ🇮🇹"] || [arg1 isEqualToString:@"بٍٍٍٍََُُُِّّّْرٍٍٍٍََُُِِّّّْآٍٍٍَُّ🇮🇹 بٍٍٍٍََُُُِّّّْرٍٍٍٍََُُِِّّّْآٍٍٍَُّ🇮🇹"]) {

        %orig(@"❌Removed❌");

    }

    %orig;
        
}

- (NSString *)secondaryText {

    NSString *orig = %orig;

    if ([orig containsString:@"بٍٍٍٍََُُُِّّّْرٍٍٍٍََُُِِّّّْآٍٍٍَُّ🇮🇹 بٍٍٍٍََُُُِّّّْرٍٍٍٍََُُِِّّّْآٍٍٍَُّ🇮🇹"] || [orig isEqualToString:@"بٍٍٍٍََُُُِّّّْرٍٍٍٍََُُِِّّّْآٍٍٍَُّ🇮🇹 بٍٍٍٍََُُُِّّّْرٍٍٍٍََُُِِّّّْآٍٍٍَُّ🇮🇹"]) {

        return @"❌Removed❌";

    }

    return orig;

}

%end