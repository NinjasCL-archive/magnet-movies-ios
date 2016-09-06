//
//  NJSAPIToken+MNCLAPIToken.h
//  Magnet Movies
//
//  Created by Camilo Castro on 05-09-16.
//  Copyright © 2016 Magnet SPA. All rights reserved.
//

#import "NJSAPIToken.h"

/*!
 *  @brief Provides an instance of the API Token class
 */
@interface NJSAPIToken (MNCLAPIToken)

/*!
 *  @brief Instance with the name and value for the endpoints
 *
 *  @return NJSAPIToken instance
 */
+ (nonnull NJSAPIToken *) token;

/*!
 *  @brief Return the token as a NSDictionary
 *
 *  @return NSDictionary with the token name and value
 */
+ (nonnull NSDictionary *) tokenParam;

@end
