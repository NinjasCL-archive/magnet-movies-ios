//
//  MNCLMovieRequester.h
//  Magnet Movies
//
//  Created by Camilo Castro on 05-09-16.
//  Copyright © 2016 Magnet SPA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Bolts/Bolts.h>

#import "NJSRequesterProtocol.h"
#import "MNCLMoviesArrayMantle.h"

@interface MNCLMovieRequester : NSObject <NJSRequesterProtocol>

/*!
 *  @brief Calls the Top Rated Movies Endpoints
 *  and returns a mantle object on success
 *
 *  @return MNCLMoviesArrayMantle on success
 */
+ (nonnull BFTask<__kindof MNCLMoviesArrayMantle *> *) getTopRatedMovies;

@end
