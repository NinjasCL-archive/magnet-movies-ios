//
//  NJSEndpoint+MNCLMovies.m
//  Magnet Movies
//
//  Created by Camilo Castro on 05-09-16.
//  Copyright © 2016 Magnet SPA. All rights reserved.
//

#import "NJSEndpoint+MNCLMovies.h"

@implementation NJSEndpoint (MNCLMovies)

+ (nonnull NSString *) movies {
    NSString * endpoint = @"movie";
    
    if ([NJSEndpoint isPrefixingEndpointsWithBaseURL]) {
        
        endpoint = [NJSEndpoint prefixEndpointWithBaseURL:endpoint];
    }
    
    return endpoint;
}

+ (nonnull NSString *) topRatedMovies {
    return [NSString
            stringWithFormat:@"%@/top_rated", [[self class] movies]];
}
@end
