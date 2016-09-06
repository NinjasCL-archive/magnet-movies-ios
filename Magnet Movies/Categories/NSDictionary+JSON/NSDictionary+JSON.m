//
//  NSDictionary+JSON.m
//  NinjaTools
//
//  Created by Camilo Castro on 10-03-16.
//  Copyright © 2016 Ninjas. All rights reserved.
//

#import "NSDictionary+JSON.h"

@implementation NSDictionary (JSON)

- (nullable NSString *) jsonString {
    
    NSError * error;
    
    if ([NSJSONSerialization isValidJSONObject:self]) {
        
        NSData * jsonData = [NSJSONSerialization
                             dataWithJSONObject:self
                             options:NSJSONWritingPrettyPrinted
                             error:&error];
        
        if (jsonData) {
            
            NSString * jsonString = [[NSString alloc]
                                     initWithData:jsonData
                                     encoding:NSUTF8StringEncoding];
            
            return  jsonString;
        }
    }
    
    return nil;
}

- (nonnull BFTask<__kindof NSString *> *) jsonStringWithTask {
    
    BFTaskCompletionSource * promise = [BFTaskCompletionSource
                                        taskCompletionSource];
    
    NSError * error;
    
    if ([NSJSONSerialization isValidJSONObject:self]) {
        
        NSData * jsonData = [NSJSONSerialization
                             dataWithJSONObject:self
                             options:NSJSONWritingPrettyPrinted
                             error:&error];
        
        if (jsonData) {
            
            NSString * jsonString = [[NSString alloc]
                                     initWithData:jsonData
                                     encoding:NSUTF8StringEncoding];
            
            [promise setResult:jsonString];
        }
    }
    
    if (error) {
        [promise setError:error];
    }
    
    return promise.task;
}

@end
