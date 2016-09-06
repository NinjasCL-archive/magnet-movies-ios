//
//  NJSJSONResponseSerializerWithData.h
//  NinjaTools
//
//  Created by Camilo Castro on 23-02-16.
//  Copyright © 2016 Ninjas. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AFNetworking/AFURLResponseSerialization.h>

/*!
 *  @brief Use this constant for retrieving json dictionary
 *  when the api calls throws an error
 */
extern NSString * const kNJSJSONResponseSerializerWithDataKey;

/*!
 * This class enables parsing JSON strings
 * returned by the server when there is an error
 */
@interface NJSJSONResponseSerializerWithData : AFJSONResponseSerializer

@end
