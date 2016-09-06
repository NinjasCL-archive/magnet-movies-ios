//
//  NJSCocoaLumberjack.m
//  NinjaTools
//
//  Created by Camilo Castro on 23-02-16.
//  Copyright © 2016 Ninjas. All rights reserved.
//

#import "NJSCocoaLumberjack.h"
#import "NJSLogger.h"
#import "NJSLogFormatter.h"

@implementation NJSCocoaLumberjack


+ (void) setup {
    
    NJSLogFormatter * formatter = [NJSLogFormatter new];
    
    DDASLLogger * aslLogger = [DDASLLogger sharedInstance];
    aslLogger.logFormatter = formatter;
    
    DDTTYLogger * ttyLogger = [DDTTYLogger sharedInstance];
    ttyLogger.logFormatter = formatter;
    
    
    // CocoaLumberjack Log Level
    // Depending on the DEBUG Enviroment Variable
    
#ifdef DEBUG
    
    NSLog(@"Debug Mode Enabled");
    
    [DDLog addLogger:aslLogger withLevel:DDLogLevelAll];
    
    [DDLog addLogger:ttyLogger withLevel:DDLogLevelAll];
    
#else
    
    NSLog(@"Production Mode Enabled");
    
    [DDLog addLogger:aslLogger withLevel:DDLogLevelError];
    
    [DDLog addLogger:ttyLogger withLevel:DDLogLevelError];
    
#endif
    
    // Set colours
    
    // See https://github.com/CocoaLumberjack/CocoaLumberjack/blob/master/Documentation/XcodeColors.md
    
    // Set colours in the Scheme 'Run' tab as Enviroment Variable
    //     "XcodeColors", "YES"
    
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor cyanColor]
                                     backgroundColor:nil
                                             forFlag:DDLogFlagInfo];
    
    
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor greenColor]
                                     backgroundColor:nil
                                             forFlag:DDLogFlagVerbose];
    
    
    DDLogInfo(@"Cocoa Lumberjack Setup Complete");
}

@end