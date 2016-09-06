//
//  NJSAPIManager.h
//  NinjaTools
//
//  Created by Camilo Castro on 23-02-16.
//  Copyright © 2016 Ninjas. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPSessionManager;

/*!
 *    Responsible for having the shared manager
 *    that makes possible on sending
 *    get, post, put, delete methods to an api.
 */
@interface NJSAPIManager : NSObject

/*!
 *  @brief Responsible for making the API calls to the server
 *  using AFNetworking Library
 *
 *  @return AFHTTPSessionManager object preconfigured for API Calls
 */
+ (nonnull AFHTTPSessionManager *) manager;

@end
