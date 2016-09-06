//
//  NJSRequesterProtocol.h
//  Magnet Movies
//
//  Created by Camilo Castro on 06-09-16.
//  Copyright © 2016 Magnet SPA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Bolts/Bolts.h>
#import <Mantle/Mantle.h>

#ifndef NJSRequesterProtocol_h
#define NJSRequesterProtocol_h

/*!
 *  @brief Provides a contract for Requesters
 */
@protocol NJSRequesterProtocol <NSObject>

/*!
 *  @brief Takes a JSON Dictionary and Pass it to the Mantle Parser
 *
 *  @param json dictionary with the data
 *
 *  @return BFTask with the mantle model
 */
+ (nonnull BFTask *) convertJSONToMantle: (nonnull NSDictionary *) json;

@end

#endif /* NJSRequesterProtocol_h */
