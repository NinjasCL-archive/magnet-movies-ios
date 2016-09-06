//
//  MNCLMovieCellLoader.h
//  Magnet Movies
//
//  Created by Camilo Castro on 06-09-16.
//  Copyright © 2016 Magnet SPA. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MNCLMovieModel;

/*!
 *  @brief Loads the corresponding cell for the movie item
 *  following the strategy design pattern
 */
@interface MNCLMovieCellLoader : NSObject

+ (CGFloat) heightForMovie:(nonnull MNCLMovieModel *) movie;

/*!
 *  @brief Provides a loader used in the 
 *
 *  @param movie     MNCLMovieModel instance
 *  @param tableView where the cells will be shown
 *  @param indexPath at what position will render inside the tableView
 *
 *  @return UITableViewCell with movie loaded info
 */
+ (nonnull UITableViewCell *) cellForMovie: (nonnull MNCLMovieModel *) movie
                               inTableView:(nonnull UITableView *) tableView
                               atIndexPath: (nonnull NSIndexPath *) indexPath;

@end
