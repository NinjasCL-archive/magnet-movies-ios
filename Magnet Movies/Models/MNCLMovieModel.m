//
//  MNCLMoviesModel.m
//  Magnet Movies
//
//  Created by Camilo Castro on 06-09-16.
//  Copyright © 2016 Magnet SPA. All rights reserved.
//

#import "MNCLMovieModel.h"

#import "MNCLMovieRequester.h"
#import "MNCLMoviesArrayMantle.h"
#import "MNCLMovieItemMantle.h"

#import "NJSLogger.h"

#import "NSDictionary+JSON.h"
#import "NSString+JSON.h"

#import <Realm/Realm.h>

@implementation MNCLMovieModel

- (NSString *) uid {
    if (!_uid) {
        _uid = @"";
    }
    
    return _uid;
}

+ (NSString *) primaryKey {
    return @"uid";
}

+ (NSDictionary *) defaultPropertyValues {
    return @{@"json" : @""};
}

#pragma mark - Class Methods

+ (nonnull BFTask<RLMResults *> *) fetchTopRatedMovies {
    
    return [[MNCLMovieRequester getTopRatedMovies]
            continueWithSuccessBlock:^id _Nullable(BFTask<__kindof
                                                   MNCLMoviesArrayMantle *> * _Nonnull t) {
        
        MNCLMoviesArrayMantle * movies = t.result;
        
        DDLogVerbose(@"Movie Array %@", movies);
        
        NSMutableArray * tasks = [@[] mutableCopy];
                
        for (MNCLMovieItemMantle * movie in movies.items) {
            
            DDLogInfo(@"Begin Saving Movie Item");
            
            DDLogVerbose(@"Movie Item %@", movie);
            
            BFTask * convertToRealm = [[[self class] mantleItemToRealmObject:movie]
                                       continueWithSuccessBlock:^id _Nullable(BFTask<__kindof MNCLMovieModel *> * _Nonnull t) {
                                           
                                        BFTaskCompletionSource * saveInBackground = [BFTaskCompletionSource taskCompletionSource];
                                        
                                        __block BOOL shouldBeginWriteTransaction = YES;
                                           
                                         dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                                             
                                             RLMRealm * realm = [RLMRealm defaultRealm];
                                             
                                             if (shouldBeginWriteTransaction) {
                                                 [realm beginWriteTransaction];
                                                 shouldBeginWriteTransaction = NO;
                                             }
                                             
                                             
                                             [realm addOrUpdateObject:t.result];
                                             
                                             [realm commitWriteTransaction];
                                             
                                             [saveInBackground setResult:t.result];
                                             
                                             DDLogInfo(@"Movie Item %@ Save Complete", movie.uid);
                                         });
                                           
                                           return saveInBackground.task;
            }];
            
            [tasks addObject:convertToRealm];
        }
        
        return [[BFTask taskForCompletionOfAllTasks:tasks]
                continueWithSuccessBlock:^id _Nullable(BFTask * _Nonnull t) {
            
                    return [MNCLMovieModel allObjects];
        }];
                
    }];
}

+ (nonnull BFTask<__kindof MNCLMovieModel *> *)
    mantleItemToRealmObject:(MNCLMovieItemMantle *) mantle {
    
    MNCLMovieModel * movie = [MNCLMovieModel new];
    
    movie.uid = (mantle.uid.stringValue ? mantle.uid.stringValue : @"");
    movie.title = mantle.title;
    
    NSError * error;
    
    NSDictionary * jsonDict = [MTLJSONAdapter
                               JSONDictionaryFromModel:mantle
                               error:&error];
    
   return [[jsonDict jsonStringWithTask]
     continueWithSuccessBlock:^id _Nullable(BFTask * _Nonnull task) {
         
         movie.json = task.result;
         
         return movie;
     }];
}

+ (RLMResults *) items {
    return [[MNCLMovieModel allObjects]
            sortedResultsUsingProperty:@"title"
            ascending:YES];
}

#pragma mark - Instance
- (nullable MNCLMovieItemMantle *) mantle {
    
    NSDictionary * json;
    
    json = [self.json jsonDictionary];
    
    NSError * error;
    
    MNCLMovieItemMantle * mantle;
    
    mantle =  [MTLJSONAdapter
               modelOfClass:MNCLMovieItemMantle.class
               fromJSONDictionary:json
               error:&error];
    
    if (error) {
        DDLogWarn(@"%@", error);
    }
    
    return mantle;
}

@end
