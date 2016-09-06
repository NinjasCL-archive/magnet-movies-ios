//
//  NJSLogFormatter.m
//  NinjaTools
//
//  Created by Camilo Castro on 23-02-16.
//  Copyright © 2016 Ninjas. All rights reserved.
//

#import "NJSLogFormatter.h"

@interface NJSLogFormatter()

@property (nonatomic) NSDateFormatter * dateFormatter;

@end

@implementation NJSLogFormatter

- (id)init {
    
    if((self = [super init])) {
        
        static NSDateFormatter * dateFormatter = nil;
        
        static dispatch_once_t onceToken;
        
        dispatch_once(&onceToken, ^{
            dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
            [dateFormatter setDateFormat:@"dd-MM-yyyy HH:mm:ss:SSS"];
        });
        
        self.dateFormatter = dateFormatter;
        
    }
    
    return self;
}

- (NSString *) formatLogMessage:(DDLogMessage *) logMessage {
    
    NSString * logLevel;
    
    switch (logMessage.flag) {
            
        case DDLogFlagError :
            logLevel = @"ERROR";
            break;
            
        case DDLogFlagWarning :
            logLevel = @"WARNING";
            break;
            
        case DDLogFlagInfo :
            logLevel = @"INFO";
            break;
            
        case DDLogFlagVerbose :
            logLevel = @"VERBOSE";
            break;
            
        case DDLogFlagDebug :
            logLevel = @"DEBUG";
            break;
            
        default :
            logLevel = @"";
            break;
    }
    
    logLevel = [logLevel stringByAppendingString:@" ~> "];
    
    NSString * dateAndTime = [self.dateFormatter
                              stringFromDate:(logMessage.timestamp)];
    
    
    return [NSString stringWithFormat:@"%@ %@ # (%lu) %@ > %@",
            logLevel,
            dateAndTime,
            (unsigned long) logMessage.line,
            logMessage.function,
            logMessage.message];
    
}

@end