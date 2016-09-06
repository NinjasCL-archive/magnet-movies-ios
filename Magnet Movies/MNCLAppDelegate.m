//
//  MNCLAppDelegate.m
//  Magnet Movies
//
//  Created by Magnet SPA on 05-09-16.
//  Copyright © 2016 Magnet SPA. All rights reserved.
//

#import "MNCLAppDelegate.h"

#import "NJSLogger.h"
#import "NJSCocoaLumberjack.h"

#import "NJSVersionManager.h"

#import "NJSEndpoint.h"

#ifdef DEBUG
BOOL const kMNCLAppIsInProduction = NO;
#else
BOOL const kMNCLAppIsInProduction = YES;
#endif

@interface MNCLAppDelegate ()

@end

@implementation MNCLAppDelegate

#pragma mark - App Delegate Methods
- (BOOL) application: (UIApplication *) application
    didFinishLaunchingWithOptions: (NSDictionary *) launchOptions {
    
    [NJSCocoaLumberjack setup];
    
    DDLogVerbose(@"%@ Is In Production? %d",
                 [NJSVersionManager
                         currentAppVersionAndBuildNumber],
                    kMNCLAppIsInProduction);
    
    [self setupEndpoints];
    
    return YES;
}

- (void) applicationDidReceiveMemoryWarning: (UIApplication *) application {
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}

#pragma mark - Setup Methods
- (void) setupEndpoints {
    
    [NJSEndpoint setEndpointBaseDevelopmentURL:@"api.themoviedb.org"
                                    testingURL:nil
                                 productionURL:nil
                                    apiVersion:@"3"];
    
    
    [NJSEndpoint setEndpointEnviroment:kNJSEndpointEnviromentDevelopment];
    
    [NJSEndpoint setAPIVersionIsExplicitInURL:YES];
    
    [NJSEndpoint setUseHTTPS:NO];
    
    [NJSEndpoint setBaseURLShouldHaveTrailingSlash:YES];
    
    [NJSEndpoint setPrefixEndpointsWithBaseURL:NO];
    
    if (kMNCLAppIsInProduction) {
        
        [NJSEndpoint setEndpointEnviroment:kNJSEndpointEnviromentProduction];
        
        [NJSEndpoint setAPIVersionIsExplicitInURL:YES];
        
        [NJSEndpoint setUseHTTPS:NO];
        
        [NJSEndpoint setBaseURLShouldHaveTrailingSlash:YES];
        
        [NJSEndpoint setPrefixEndpointsWithBaseURL:NO];
        
    }
    
    DDLogVerbose(@"Using Endpoint \n%@ \nEnviroment id %d \n",
                 [NJSEndpoint baseURL],
                 (int)[NJSEndpoint enviroment]);
    
    DDLogInfo(@"Endpoint Setup Complete");
}
@end
