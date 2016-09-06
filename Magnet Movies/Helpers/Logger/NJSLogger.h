//
//  NJSLogger.h
//  NinjaTools
//
//  Created by Camilo Castro on 23-02-16.
//  Copyright © 2016 Ninjas. All rights reserved.
//

/*!
 *    Provides Quicker Access to CocoaLumberjack
 *    Import on files that want to use DDLog Functions
 */
#ifndef NJSLogger_h
#define NJSLogger_h

#import <CocoaLumberjack/CocoaLumberjack.h>

#ifdef DEBUG
static const long ddLogLevel = (long) DDLogLevelAll;
#else
static const long ddLogLevel = (long) DDLogLevelError;
#endif

#endif /* NJSLogger_h */