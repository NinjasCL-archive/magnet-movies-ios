//
//  NJSVersionManager.h
//  NinjaTools
//
//  Created by Camilo Castro on 25-03-16.
//  Copyright © 2016 Ninjas.cl. All rights reserved.
//

#import "NJSVersionManager.h"



@implementation NJSVersionManager


+ (nonnull NSString *) currentVersion {
    return [[[NSBundle mainBundle] infoDictionary]
            objectForKey:@"CFBundleShortVersionString"];
}

+ (nonnull NSString *) currentBuildNumber {
   return [[[NSBundle mainBundle] infoDictionary]
           objectForKey:@"CFBundleVersion"];
}

+ (nonnull NSString *) currentAppVersionAndBuildNumber {
    return [NSString
            stringWithFormat:@"App Version: %@ Build Number: %@",
            [NJSVersionManager currentVersion],
            [NJSVersionManager currentBuildNumber]];
}
@end
