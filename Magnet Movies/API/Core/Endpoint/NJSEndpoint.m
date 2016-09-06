//
//  NJSEndpoint.m
//  NinjaTools
//
//  Created by Camilo Castro on 23-02-16.
//  Copyright © 2016 Ninjas. All rights reserved.
//

#import "NJSEndpoint.h"

static BOOL _useHTTPS = NO;
static BOOL _prefixEndpointsWithBaseURL = NO;
static BOOL _apiVersionIsExplicitInURL = NO;
static BOOL _baseURLShouldHaveTrailingSlash = NO;

static NSString * _developmentURL = @"";
static NSString * _testingURL = @"";
static NSString * _productionURL = @"";
static NSString * _apiVersion = @"";

static kNJSEndpointEnviroment _enviroment = kNJSEndpointEnviromentDevelopment;

@implementation NJSEndpoint

#pragma mark - Setup

+ (void) setUseHTTPS: (BOOL) useHTTPS {
    _useHTTPS = useHTTPS;
}

+ (void) setAPIVersionIsExplicitInURL:(BOOL) explicitAPIVersion {
    _apiVersionIsExplicitInURL = explicitAPIVersion;
}

+ (void) setPrefixEndpointsWithBaseURL: (BOOL) prefixEndpointsWithBaseURL {
    _prefixEndpointsWithBaseURL = prefixEndpointsWithBaseURL;
}

+ (void) setEndpointEnviroment: (kNJSEndpointEnviroment) enviroment {
    _enviroment = enviroment;
}

+ (void) setBaseURLShouldHaveTrailingSlash: (BOOL) baseURLShouldHaveTrailingSlash {
    _baseURLShouldHaveTrailingSlash = baseURLShouldHaveTrailingSlash;
}

+ (void) setEndpointBaseDevelopmentURL:(nonnull NSString *) developmentURL
                            testingURL: (nullable NSString *) testingURL
                         productionURL: (nullable NSString *) productionURL
                            apiVersion: (nullable NSString *) apiVersion {
    
    _developmentURL = developmentURL;
    _testingURL = testingURL;
    _productionURL = productionURL;
    _apiVersion = apiVersion;
    
    NSAssert(_developmentURL != nil, @"Development URL should not be nil");
    
    NSAssert(![_developmentURL isEqualToString:@""], @"Development URL "\
                                                                @"should not be blank");
    
    if (!_testingURL || [_testingURL isEqualToString:@""]) {
        _testingURL = _developmentURL;
    }
    
    if (!_productionURL || [_productionURL isEqualToString:@""]) {
        _productionURL = _developmentURL;
    }
}

#pragma mark - Utility

+ (kNJSEndpointEnviroment) enviroment {

    if (!_enviroment) {
        _enviroment = kNJSEndpointEnviromentDevelopment;
    }
    
    return _enviroment;
}


+ (BOOL) isPrefixingEndpointsWithBaseURL {
    return _prefixEndpointsWithBaseURL;
}

+ (BOOL) isUsingHTTPS {
    return _useHTTPS;
}

+ (BOOL) apiVersionIsExplicitInURL {
    return _apiVersionIsExplicitInURL;
}

+ (BOOL) baseURLShouldHaveTrailingSlash {
    return _baseURLShouldHaveTrailingSlash;
}

+ (nullable NSString *) apiVersion {
    return _apiVersion;
}

+ (nullable NSString *) prefixEndpointWithBaseURL: (nonnull NSString *) endpoint {
    return [NSString stringWithFormat:@"%@%@",
            [NJSEndpoint baseURL], endpoint];
}

+ (nullable NSString *) removeLastTrailingSlashFromEndpoint: (nonnull NSString *) endpoint {
    
    NSString * result = endpoint;
    
    if ([self endpointEndsWithTrailingSlash:endpoint]) {
        
        NSRange range = NSMakeRange(0, endpoint.length - 1);
        
        result = [endpoint substringWithRange:range];
    }
    
    return result;
}

+ (nullable NSString *) appendTrailingSlashToEndpoint: (nonnull NSString *) endpoint {
    
    NSString * result = endpoint;
    
    if (![self endpointEndsWithTrailingSlash:endpoint]) {
        
        result = [NSString stringWithFormat:@"%@/", endpoint];
        
    }
    
    return result;
}

#pragma mark Private Methods

+ (nonnull NSString *) getProtocol {
    
    if ([self isUsingHTTPS]) {
        return @"https";
    }
    
    return @"http";
}

+ (nullable NSString *) endpointForURL: (nonnull NSString *) url {
    
    if (!url || [url isEqualToString:@""]) {
        url = _developmentURL;
    }
    
    NSString * endpoint = [NSString stringWithFormat:@"%@://%@",
                           [NJSEndpoint getProtocol],
                           url];
    
    if ([NJSEndpoint apiVersionIsExplicitInURL]) {
        endpoint = [NSString stringWithFormat:@"%@/%@",
                    endpoint,
                    [NJSEndpoint apiVersion]];
    }
    
    return endpoint;
}

+ (BOOL) endpointEndsWithTrailingSlash: (NSString *) endpoint {
    
    if (endpoint.length > 0) {
        
        NSString * lastChar = [endpoint
                               substringFromIndex:endpoint.length - 1];
        
        if ([lastChar isEqualToString:@"/"]) {
            return YES;
        }
    }
    
    return NO;
}

#pragma mark - Base Endpoints

+ (nonnull NSString *) developmentURL {
    
    NSString * endpoint = [NJSEndpoint endpointForURL:_developmentURL];
    
    return endpoint;
}

+ (nonnull NSString *) testingURL {
    
    NSString * endpoint = [NJSEndpoint endpointForURL:_testingURL];
    
    return endpoint;
}

+ (nonnull NSString *) productionURL {
    
    NSString * endpoint = [NJSEndpoint endpointForURL:_productionURL];
    
    return endpoint;
}

+ (nonnull NSString *) baseURL {

    NSString * url = @"";
    
    switch (_enviroment) {
        
        case kNJSEndpointEnviromentTesting: {
            url = [NJSEndpoint testingURL];
            break;
        }
        
        case kNJSEndpointEnviromentProduction: {
            url = [NJSEndpoint productionURL];
            break;
        }
        
        default: {
            url = [NJSEndpoint developmentURL];
        }
    }
    
    if ([NJSEndpoint baseURLShouldHaveTrailingSlash]) {
        
        url = [NJSEndpoint appendTrailingSlashToEndpoint:url];
    }
    
    return url;
}

@end
