//
//  NSDictionary+JSON.h
//  NinjaTools
//
//  Created by Camilo Castro on 10-03-16.
//  Copyright © 2016 Ninjas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Bolts/Bolts.h>

/*!
 *  @brief Provides helper methods for dealing with json and nsdictionarys
 *  also using promises.
 */
@interface NSDictionary (JSON)

/*!
 *  @brief Provides a json nsstring from the values inside the dictionary
 *
 *  @return NSString with a JSON formatted string
 */
- (nullable NSString *) jsonString;

/*!
 *  @brief Provides a json nsstring from a nsdictionary inside a BFTask
 *
 *  @return NSString with a JSON formatted string on success
 */
- (nonnull BFTask<__kindof NSString *> *) jsonStringWithTask;

@end
