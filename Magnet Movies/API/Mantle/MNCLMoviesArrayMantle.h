//
//  MNCLMoviesArrayMantle.h
//  Magnet Movies
//
//  Created by Camilo Castro on 06-09-16.
//  Copyright © 2016 Magnet SPA. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "NJSArrayMantleProtocol.h"

/*!
 *  @brief Handles the Array of Movies inside the Json
 */
@interface MNCLMoviesArrayMantle : MTLModel <MTLJSONSerializing, NJSArrayMantleProtocol>

/*!
 *  @brief Page Number for the Items
 */
@property (nonatomic, nonnull) NSNumber * page;

/*!
 *  @brief Total Number of Pages
 */
@property (nonatomic, nonnull) NSNumber * totalPages;

/*!
 *  @brief Total Number of Movie Items Found
 */
@property (nonatomic, nonnull) NSNumber * totalResults;

@end
