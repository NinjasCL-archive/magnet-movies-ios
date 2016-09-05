//
//  MNCLMovie.m
//  Magnet Movies
//
//  Created by Magnet SPA on 05-09-16.
//  Copyright © 2016 Magnet SPA. All rights reserved.
//

#import "MNCLMovie.h"
#import "AFNetworking.h"

@implementation MNCLMovie

# pragma mark - API

+ (AFHTTPSessionManager *)defaultManager {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    return manager;
}

+ (void)getTopRatedMovies {
    AFHTTPSessionManager *manager = [self defaultManager];
    
    NSDictionary *parameters = @{
                                 @"api_key": @"a1ae624ccb0a7b33f45b521d1e2681b4"
                                 };
    
    [manager GET:@"http://api.themoviedb.org/3/movie/top_rated"
      parameters:parameters
        progress:^(NSProgress * _Nonnull downloadProgress) {}
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             NSLog(@"Top rated movies: %@", responseObject);
         }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {}];
}

@end
