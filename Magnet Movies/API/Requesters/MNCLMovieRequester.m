//
//  MNCLMovieRequester.m
//  Magnet Movies
//
//  Created by Camilo Castro on 05-09-16.
//  Copyright © 2016 Magnet SPA. All rights reserved.
//

#import "MNCLMovieRequester.h"

#import "NJSLogger.h"

#import "NJSAPIManager.h"
#import "NJSEndpoint+MNCLMovies.h"
#import "NJSAPIToken+MNCLAPIToken.h"

#import <AFNetworking/AFNetworking.h>

@implementation MNCLMovieRequester

+ (nonnull BFTask<__kindof NSDictionary *> *) getTopRatedMovies {
    
    BFTaskCompletionSource * promise = [BFTaskCompletionSource taskCompletionSource];
    
    NSDictionary * params = [NJSAPIToken tokenParam];
    
    NSString * endpoint = [NJSEndpoint topRatedMovies];
    
    AFHTTPSessionManager * manager = [NJSAPIManager manager];
    
    DDLogInfo(@"Downloading Top Rated Movies");
    
    [manager GET:endpoint
      parameters:params
        progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task,
                id  _Nullable responseObject) {
        
        DDLogInfo(@"Top Rated Movies Downloaded");
        
        DDLogVerbose(@"Top Rated Movies JSON %@", responseObject);
        
        [promise setResult:responseObject];
        
    } failure:^(NSURLSessionDataTask * _Nullable task,
                NSError * _Nonnull error) {
        
        DDLogWarn(@"Could Not Download Movies JSON %@", error);
        
        [promise setError:error];
        
    }];
    
    return promise.task;
}
@end
