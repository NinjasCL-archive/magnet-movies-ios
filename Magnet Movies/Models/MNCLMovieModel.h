//
//  MNCLMoviesModel.h
//  Magnet Movies
//
//  Created by Camilo Castro on 06-09-16.
//  Copyright © 2016 Magnet SPA. All rights reserved.
//

#import <Realm/Realm.h>
#import <Bolts/Bolts.h>

#import "MNCLMoviesArrayMantle.h"

/*!
 *  @brief Holds the Movies inside the Data Base
 */
@interface MNCLMovieModel : RLMObject

@property (nonatomic, nullable) NSString * uid;

@property (nonatomic, nullable) NSString * json;

- (nullable MNCLMoviesArrayMantle *) mantle;

+ (nonnull BFTask<MNCLMoviesArrayMantle*>*) fetchTopRatedMovies;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<MNCLMoviesModel>
RLM_ARRAY_TYPE(MNCLMoviesModel)
