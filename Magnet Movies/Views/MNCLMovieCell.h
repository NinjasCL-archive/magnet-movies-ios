//
//  MNCLMovieCell.h
//  Magnet Movies
//
//  Created by Camilo Castro on 06-09-16.
//  Copyright © 2016 Magnet SPA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NJSTableViewCellProtocol.h"

@class MNCLMovieModel;

/*!
 *  @brief Draws a Single Movie Cell
 */
@interface MNCLMovieCell : UITableViewCell <NJSTableViewCellProtocol>

@property (nonnull, nonatomic) MNCLMovieModel * movie;

/*!
 *  @brief Initialize all cell properties with the movie values
 *
 *  @param movie with the data
 */
- (void) initWithMovie: (nonnull MNCLMovieModel *) movie;

@end
