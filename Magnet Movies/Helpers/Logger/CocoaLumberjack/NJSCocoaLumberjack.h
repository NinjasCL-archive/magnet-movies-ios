//
//  NJSCocoaLumberjack.h
//  NinjaTools
//
//  Created by Camilo Castro on 23-02-16.
//  Copyright © 2016 Ninjas. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 *   @brief Contains methods for helping with
 *    Cocoa Lumberjack
 */
@interface NJSCocoaLumberjack : NSObject

/*!
 *    @brief Initialize Cocoa Lumberjack and configure
 *    the Logger. Call this function in AppDelegate's
 *    didFinishLaunchingWithOptions: method.
 */
+ (void) setup;

@end