//
//  NJSAPIToken+MNCLAPIToken.m
//  Magnet Movies
//
//  Created by Camilo Castro on 05-09-16.
//  Copyright © 2016 Magnet SPA. All rights reserved.
//

#import "NJSAPIToken+MNCLAPIToken.h"

@implementation NJSAPIToken (MNCLAPIToken)

+ (nonnull NJSAPIToken *) token {
    
    __block NJSAPIToken * token;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        token = [NJSAPIToken new];
        token.name = @"api_key";
        token.value = @"a1ae624ccb0a7b33f45b521d1e2681b4";
    });

    
    return token;
}

+ (nonnull NSDictionary *) tokenParam {
    
    __block NSDictionary * dict;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NJSAPIToken * token = [[self class] token];
        dict = @{token.name : token.value};
    });
    
    return dict;
}
@end
