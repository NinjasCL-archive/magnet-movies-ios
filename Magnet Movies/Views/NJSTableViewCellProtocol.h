//
//  NJSTableViewCellProtocol.h
//  NinjaTools
//
//  Created by Camilo Castro on 06-09-16.
//  Copyright © 2016 Ninjas. All rights reserved.
//

#ifndef NJSTableViewCellProtocol_h
#define NJSTableViewCellProtocol_h

#import <Foundation/Foundation.h>

@protocol NJSTableViewCellProtocol <NSObject>

/*!
 *  @brief Provides the identifier for the cell 
 *  should be used when loading the cell for the table view
 *
 *  @return NSString with the cell identifier
 */
+ (nonnull NSString *) cellIdentifier;

@optional
/*!
 *  @brief A Cell Custom Height
 *
 *  @return NSUInteger with the custom height
 */
+ (CGFloat) cellHeight;

@end

#endif /* NJSTableViewCellProtocol_h */
