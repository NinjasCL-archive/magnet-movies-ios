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

#import <Realm/Realm.h>

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
    
    [self setupRealm];
    [self setupEndpoints];
    
    return YES;
}

- (void) applicationDidReceiveMemoryWarning: (UIApplication *) application {
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}

#pragma mark - Setup Methods
- (void) setupRealm {
    
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    // Set the new schema version. This must be greater than the previously used
    // version (if you've never set a schema version before, the version is 0).
    config.schemaVersion = 1;
    
    // Set the block which will be called automatically when opening a Realm with a
    // schema version lower than the one set above
    config.migrationBlock = ^(RLMMigration *migration, uint64_t oldSchemaVersion) {
        // We haven’t migrated anything yet, so oldSchemaVersion == 0
        if (oldSchemaVersion < 1) {
            // Nothing to do!
            // Realm will automatically detect new properties and removed properties
            // And will update the schema on disk automatically
        }
    };
    
    // Tell Realm to use this new configuration object for the default Realm
    [RLMRealmConfiguration setDefaultConfiguration:config];
    
    // Now that we've told Realm how to handle the schema change, opening the file
    // will automatically perform the migration
    [RLMRealm defaultRealm];
}

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
