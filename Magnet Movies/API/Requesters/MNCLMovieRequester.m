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
#import <Mantle/Mantle.h>

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
    
    return [promise.task
            continueWithSuccessBlock:^id _Nullable(BFTask * _Nonnull t) {
                return [[self class] convertJSONToMantle:t.result];
    }];
}

+ (nonnull BFTask *) convertJSONToMantle: (nonnull NSDictionary *) json {
    
    BFTaskCompletionSource * promise = [BFTaskCompletionSource
                                        taskCompletionSource];
    
    NSError * error;
    
    DDLogInfo(@"Prepare to Parsing Movies Array JSON");
    
    MNCLMoviesArrayMantle * data = [MTLJSONAdapter
                                  modelOfClass:MNCLMoviesArrayMantle.class
                                  fromJSONDictionary:json
                                  error:&error];
    
    if (error) {
        
        [promise setError:error];
        
    } else {
        
        DDLogInfo(@"Json Parsing Complete");
        
        [promise setResult:data];
    }
    
    return promise.task;
}
@end
