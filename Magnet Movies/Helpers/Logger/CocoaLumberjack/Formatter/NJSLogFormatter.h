//
//  NJSLogFormatter.h
//  NinjaTools
//
//  Created by Camilo Castro on 23-02-16.
//  Copyright © 2016 Ninjas. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CocoaLumberjack/CocoaLumberjack.h>

/*!
 *    Formats Logs in a Meaninfull way
 *    @brief Based on https://github.com/devmob-DE/CocoaLumberjack-DMLogFormatter
 */
@interface NJSLogFormatter : NSObject <DDLogFormatter>

@end