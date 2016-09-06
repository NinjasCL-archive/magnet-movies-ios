//
//  NJSVersionManager.h
//  NinjaTools
//
//  Created by Camilo Castro on 25-03-16.
//  Copyright © 2016 Ninjas.cl. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 *  @brief Easy access to the current version
 *  see http://stackoverflow.com/questions/6851660/version-vs-build-in-xcode
 */
@interface NJSVersionManager : NSObject

/*!
 *  @brief Returns the current version of the app
 *
 *  @return NSString with the current version number
 */
+ (nonnull NSString *) currentVersion;

/*!
 *  @brief Returns the build number for the app
 *
 *  @return NSString with the current build number
 */
+ (nonnull NSString *) currentBuildNumber;

/*!
 *  @brief Returns the current app and build number as a string
 *  that could be printed elsewhere.
 *
 *  @return NSString ex: App Version 1.0 Build Version 1111
 */
+ (nonnull NSString *) currentAppVersionAndBuildNumber;

@end
