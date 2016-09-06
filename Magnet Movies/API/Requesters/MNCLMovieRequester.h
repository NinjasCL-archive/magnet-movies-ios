//
//  MNCLMovieRequester.h
//  Magnet Movies
//
//  Created by Camilo Castro on 05-09-16.
//  Copyright © 2016 Magnet SPA. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Bolts/Bolts.h>

@interface MNCLMovieRequester : NSObject

/*!
 *  @brief Calls the Top Rated Movies Endpoints
 *  and returns a json on success
 *
 *  @return NSDictionary with the json on success
 */
+ (nonnull BFTask<__kindof NSDictionary *> *) getTopRatedMovies;

@end
