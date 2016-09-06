//
//  NSString+JSON.m
//  NinjaTools
//
//  Created by Camilo Castro on 10-03-16.
//  Copyright © 2016 Ninjas. All rights reserved.
//

#import "NSString+JSON.h"

@implementation NSString (JSON)

- (nullable NSDictionary *) jsonDictionary {
    
    NSError * error;
    
    NSDictionary * json = [NSJSONSerialization JSONObjectWithData:[self
                                                                   dataUsingEncoding:NSUTF8StringEncoding]
                                                          options:kNilOptions
                                                            error:&error];

    return json;
}

- (nonnull BFTask *) jsonDictionaryWithTask {
    
    NSError * error;
    
    NSDictionary * json = [NSJSONSerialization JSONObjectWithData:[self
                                                                   dataUsingEncoding:NSUTF8StringEncoding]
                                                          options:kNilOptions
                                                            error:&error];
    
    BFTaskCompletionSource * promise = [BFTaskCompletionSource taskCompletionSource];
    
    if (error) {
        [promise setError:error];
    } else {
        [promise setResult:json];
    }
    
    return promise.task;
}
@end
