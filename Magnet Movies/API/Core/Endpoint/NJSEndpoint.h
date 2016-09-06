//
//  NJSEndpoint.h
//  NinjaTools
//
//  Created by Camilo Castro on 23-02-16.
//  Copyright © 2016 Ninjas. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, kNJSEndpointEnviroment) {
    kNJSEndpointEnviromentDevelopment = 0,
    kNJSEndpointEnviromentTesting,
    kNJSEndpointEnviromentProduction
};

/*!
 *    Provides with the base endpoint for all the requests,
 *    can change between the production endpoint or use https
 *    using the utility methods:
 *
 *    + (void) setEndpointBaseDevelopmentURL:(NSString *) developmentURL
 *       testingURL: (NSString *) testingURL
 *       productionURL: (NSString *) productionURL
 *       apiVersion: (NSString *) apiVersion;
 *
 *    + (void) setEndpointEnviroment: (kNJSEndpointEnviroment) enviroment;
 *
 *    + (void) setUseHTTPS: (BOOL) useHTTPS;
 *
 *    Use above methods in App Delegate, before doing any request.
 */
@interface NJSEndpoint : NSObject

#pragma mark - Setup Methods

/*!
 *  @brief Sets the base URLS that will be used when generating the endpoints
 *
 *  @param developmentURL An URL used primary for developers
 *  @param testingURL     An URL used for testing before production
 *  @param productionURL  The final URL that will be used in AppStore
 *  @param apiVersion the current version number for the API
 *
 *  @note At least the developmentURL should be set, all the others defaults
 *   to the developmentURL
 */
+ (void) setEndpointBaseDevelopmentURL:(nonnull NSString *) developmentURL
                            testingURL: (nullable NSString *) testingURL
                         productionURL: (nullable NSString *) productionURL
                            apiVersion: (nullable NSString *) apiVersion;

/*!
 *  @brief Defines the enviroment on which the endpoints will generate
 *
 *  @param enviroment kNJSEndpointEnviroment Number
 */
+ (void) setEndpointEnviroment: (kNJSEndpointEnviroment) enviroment;

/*!
 *    Sets if the system will use https or http protocol
 *    @brief defaults to NO
 
 *    @param useHTTPS YES for using HTTPS
 */
+ (void) setUseHTTPS: (BOOL) useHTTPS;

/*!
 *  @brief Sets if the API Version will be present in all urls after the endpoint
 *  defaults to NO;
 *
 *  @param explicitAPIVersion YES for explicit
 */
+ (void) setAPIVersionIsExplicitInURL: (BOOL) explicitAPIVersion;

/*!
 *    All the endpoints will return the full url, not just the path to the resource.
 *
 *    @brief
 *    defaults to NO.
 *    With Prefix : https://api.example.com/users
 *
 *    Without Prefix : users
 *
 *
 *    @param prefixEndpointsWithBaseURL YES for prefixing all endpoints
 */
+ (void) setPrefixEndpointsWithBaseURL: (BOOL) prefixEndpointsWithBaseURL;

/*!
 *  @brief Sets if the Base URL should have a Trailing Slash
 *
 *  examples: 
 *
 *  YES : api/ 
 *
 *  NO: api
 *
 *  defaults to NO
 *
 *  @param baseURLShouldHaveTrailingSlash BOOL YES if should append trailing slash to any call to baseURL
 */
+ (void) setBaseURLShouldHaveTrailingSlash: (BOOL) baseURLShouldHaveTrailingSlash;

#pragma mark - Utility Methods

/*!
 *  @brief Returns the current enviroment for the endpoints
 *
 *  @return kNJSEndpointEnviroment number
 */
+ (kNJSEndpointEnviroment) enviroment;

/*!
 *    Returns the state of using HTTPS.
 *
 *    @return YES if using HTTPS.
 */
+ (BOOL) isUsingHTTPS;

/*!
 *  @brief Returns if the API Version is Explicit in the url
 *
 *  @return YES if is Explicit
 */
+ (BOOL) apiVersionIsExplicitInURL;

/*!
 *    Returns the state of using prefix
 *
 *    @return YES if using prefix
 */
+ (BOOL) isPrefixingEndpointsWithBaseURL;

/*!
 *  @brief Returns if the base url have trailing slash
 *
 *  @return YES if haves trailing slash
 */
+ (BOOL) baseURLShouldHaveTrailingSlash;

#pragma mark - Base Endpoints

/*!
 *    Returns the base development url endpoint
 *
 *    @return NSString with an endpoint for development
 */
+ (nonnull NSString *) developmentURL;

/*!
 *    Returns the base testing url endpoint
 *
 *    @return NSString with an endpoint for testing
 */
+ (nonnull NSString *) testingURL;

/*!
 *    Returns the base production url endpoint
 *
 *    @return NSString with an endpoint for production
 */
+ (nonnull NSString *) productionURL;

/*!
 *    Tells the working URL depending on the enviroment sat before
 *
 *    @return testingURL or productionURL
 */
+ (nonnull NSString *) baseURL;

/*!
 *  @brief Returns the API version sat before
 *
 *  @return NSString with the API version
 */
+ (nullable NSString *) apiVersion;

/*!
 *    Prefix an Endpoint with the Base URL
 *
 *    @param endpoint for prefixing
 *
 *    @return NSString with the endpoint and base url
 */
+ (nullable NSString *) prefixEndpointWithBaseURL: (nonnull NSString *) endpoint;

/*!
 *    Append a trailing slash to endpoint if not present already
 *
 *    @param endpoint to append a trailing slash
 *
 *    @return endpoint with a final trailing slash
 */
+ (nullable NSString *) appendTrailingSlashToEndpoint: (nonnull NSString *) endpoint;

/*!
 *    Remove trailing slash from endpoint
 *
 *    @param endpoint to remove
 *
 *    @return endpoint without trailing slash
 */
+ (nullable NSString *) removeLastTrailingSlashFromEndpoint: (nonnull NSString *) endpoint;

@end
