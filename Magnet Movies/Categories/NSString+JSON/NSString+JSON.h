//
//  NSString+JSON.h
//  NinjaTools
//
//  Created by Camilo Castro on 10-03-16.
//  Copyright © 2016 Ninjas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Bolts/Bolts.h>

/*!
 *  @brief Provides easier json conversions from nsstring
 */
@interface NSString (JSON)

- (nullable NSDictionary *) jsonDictionary;

/*!
 *  @brief converts the string to a json dictionary
 *  and returns the task
 *
 *  @return NSDictionary with the json string on success
 */
- (nonnull BFTask *) jsonDictionaryWithTask;

@end
