//
//  NJSArrayMantleProtocol.h
//  NinjaTools
//
//  Created by Camilo Castro on 06-09-16.
//  Copyright © 2016 Ninjas. All rights reserved.
//

#ifndef NJSArrayMantleProtocol_h
#define NJSArrayMantleProtocol_h

/*!
 *  @brief Provides a contract for a mantle
 *  that contains an array of items
 */
@protocol NJSArrayMantleProtocol <NSObject>

/*!
 *  @brief The items of the array
 */
@property (nonatomic, nullable) NSArray * items;

@end

#endif /* NJSArrayMantleProtocol_h */
