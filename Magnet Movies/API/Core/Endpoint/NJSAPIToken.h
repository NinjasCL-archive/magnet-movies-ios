//
//  NJSAPIToken.h
//  NinjaTools
//
//  Created by Camilo Castro on 23-02-16.
//  Copyright © 2016 Ninjas. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 *  @brief Provides an Object for defining the access token
 *  to the API
 */
@interface NJSAPIToken : NSObject

/*!
 *  @brief Token Name ex `api_key`
 */
@property (nonatomic, nonnull) NSString * name;

/*!
 *  @brief Token Value ex `a1ae624ccb0a7b33f45b521d1e2681b4`
 */
@property (nonatomic, nonnull) NSString * value;

@end
