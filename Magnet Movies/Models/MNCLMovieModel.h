//
//  MNCLMoviesModel.h
//  Magnet Movies
//
//  Created by Camilo Castro on 06-09-16.
//  Copyright © 2016 Magnet SPA. All rights reserved.
//

#import <Realm/Realm.h>
#import <Bolts/Bolts.h>

#import "MNCLMovieItemMantle.h"

/*!
 *  @brief Holds the Movies inside the Data Base
 */
@interface MNCLMovieModel : RLMObject

@property (nonatomic, nullable) NSString * uid;

@property (nonatomic, nullable) NSString * title;

@property (nonatomic, nullable) NSString * json;

/*!
 *  @brief An Object that holds the information for the movie
 *
 *  @return MNCLMovieItemMantle instance
 */
- (nullable MNCLMovieItemMantle *) mantle;

#pragma mark - Class Methods

/*!
 *  @brief Calls the server and get the top rated movie
 *
 *  @return NSArray of MNCLMovieModel Objects
 */
+ (nonnull BFTask<RLMResults *> *) fetchTopRatedMovies;

/*!
 *  @brief Items sorted by title
 *
 *  @return MNCLMocieModel Array
 */
+ (nonnull RLMResults<MNCLMovieModel *> *) items;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<MNCLMoviesModel>
RLM_ARRAY_TYPE(MNCLMoviesModel)
