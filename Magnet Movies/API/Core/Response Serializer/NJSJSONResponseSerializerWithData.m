//
//  NJSJSONResponseSerializerWithData.m
//  NinjaTools
//
//  Created by Camilo Castro on 23-02-16.
//  Copyright © 2016 Ninjas. All rights reserved.
//

#import "NJSJSONResponseSerializerWithData.h"

NSString * const kNJSJSONResponseSerializerWithDataKey = \
                                    @"cl.ninjas:JSONErrorResponse";

@implementation NJSJSONResponseSerializerWithData

- (instancetype) responseObjectForResponse: (NSURLResponse *) response
                                      data: (NSData *) data
                                     error: (NSError *__autoreleasing *) error {
    
    id JSONObject  = [super responseObjectForResponse:response
                                                 data:data
                                                error:error];
    
    if (* error != nil) {
        
        NSMutableDictionary * userInfo = [(*error).userInfo mutableCopy];
        
        // Set an empty dict for default value
        userInfo[kNJSJSONResponseSerializerWithDataKey] = @{};
        
        if (data) {
            
            NSError * err = [[NSError alloc] init];
            
            // Dictionary
            NSDictionary * json_dict = [NSJSONSerialization
                                        JSONObjectWithData: data
                                        options: NSJSONReadingMutableContainers
                                        error: &err];
            
            // Only assign if Json is Valid
            if (json_dict) {
                userInfo[kNJSJSONResponseSerializerWithDataKey] = json_dict;
            }
        }
        
        NSError * newError = [NSError errorWithDomain:(*error).domain
                                                 code:(*error).code
                                             userInfo:userInfo];
        
        (*error) = newError;
    }
    
    return (JSONObject);
}


@end
