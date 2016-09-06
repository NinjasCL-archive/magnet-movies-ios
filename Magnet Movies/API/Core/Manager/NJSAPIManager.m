//
//  NJSAPIManager.m
//  NinjaTools
//
//  Created by Camilo Castro on 23-02-16.
//  Copyright © 2016 Ninjas. All rights reserved.
//

#import "NJSAPIManager.h"

#import "NJSEndpoint.h"
#import "NJSJSONResponseSerializerWithData.h"

#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/AFNetworkActivityIndicatorManager.h>

@implementation NJSAPIManager

+ (nonnull AFHTTPSessionManager *) manager {
    
    static AFHTTPSessionManager * manager = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        if (![NJSEndpoint isPrefixingEndpointsWithBaseURL]) {
            
            NSURL * baseUrl = [NSURL URLWithString:[NJSEndpoint baseURL]];
            
            manager = [[AFHTTPSessionManager alloc]
                       initWithBaseURL:baseUrl];
        } else {
            
            manager = [AFHTTPSessionManager manager];
        }
        
        
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        
        // Headers
        
        [manager.requestSerializer setValue:@"application/json"
                         forHTTPHeaderField:@"Accept"];
        
        [manager.requestSerializer setValue:@"Close"
                         forHTTPHeaderField:@"Connection"];
        
        if (![NJSEndpoint apiVersionIsExplicitInURL]) {
            
            [manager.requestSerializer
             setValue:[NJSEndpoint apiVersion]
             forKey:@"APIVersion"];
        }
        
        
        manager.responseSerializer = [NJSJSONResponseSerializerWithData serializer];
        
        // See http://initwithfunk.com/blog/2014/03/12/afnetworking-ssl-pinning-with-self-signed-certificates/
        //
        // http://nsscreencast.com/episodes/73-ssl-pinning
        //
        // http://www.migueldiazrubio.com/2013/10/21/desarrollo-ios-7-introduccion-afnetworking-2/#
        
        if ([NJSEndpoint isUsingHTTPS]) {
            
            // SSL Pinning
            AFSecurityPolicy * securityPolicy = [AFSecurityPolicy
                                                 policyWithPinningMode:
                                                 AFSSLPinningModePublicKey];
            
            securityPolicy.allowInvalidCertificates = YES;
            
//             This code is useful when you need a certificate with
//             a specific name
//             or more than one certificate.
//
//            securityPolicy.validatesDomainName = NO;
//
//            NSString * pathToCertificate = [[NSBundle mainBundle]
//                                                    pathForResource:@"CertificateName"
//                                                    ofType:@"cer"];
//
//            NSData * certificate = [NSData
//                                    dataWithContentsOfFile:pathToCertificate];
//
//            securityPolicy.pinnedCertificates = @[certificate];

            manager.securityPolicy = securityPolicy;
            
        }
        
        // Other Options
        
        manager.reachabilityManager = [AFNetworkReachabilityManager
                                       managerForDomain:[NJSEndpoint baseURL]];
        
        
        // Enable Activity Indicator
        [[AFNetworkActivityIndicatorManager sharedManager]
         setEnabled:YES];
        
        
    });
    
    return manager;
}
@end
