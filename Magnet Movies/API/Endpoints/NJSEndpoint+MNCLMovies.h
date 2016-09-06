//
//  NJSEndpoint+MNCLMovies.h
//  Magnet Movies
//
//  Created by Camilo Castro on 05-09-16.
//  Copyright © 2016 Magnet SPA. All rights reserved.
//

#import "NJSEndpoint.h"

/*!
 *  @brief Provides Endpoints Related to API Movies
 */
@interface NJSEndpoint (MNCLMovies)

/*!
 *  @brief Return the movies endpoint
 *  Ex: http://api.themoviedb.org/3/movie/
 *  @return NSString with the movies endpoint
 */
+ (nonnull NSString *) movies;

/*!
 *  @brief Return the top rated movies endpoint
 *  Ex: http://api.themoviedb.org/3/movie/top_rated
 *  @return NSString with the top rated movies endpoint
 */
+ (nonnull NSString *) topRatedMovies;

/*!
 *  @brief Returns the URL for fetching the Images
 *  @param NSString path of the image
 *  @return NSURL with the full url for the path given
 */
+ (nonnull NSURL *) movieImageURLForPath: (nonnull NSString *) path;

@end
