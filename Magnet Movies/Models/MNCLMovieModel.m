//
//  MNCLMoviesModel.m
//  Magnet Movies
//
//  Created by Camilo Castro on 06-09-16.
//  Copyright © 2016 Magnet SPA. All rights reserved.
//

#import "MNCLMovieModel.h"

@implementation MNCLMovieModel

+ (NSDictionary *)defaultPropertyValues {
    return @{@"json" : @""};
}

- (nullable MNCLMoviesArrayMantle *) movies {
    return [MNCLMoviesArrayMantle ]
}
@end
