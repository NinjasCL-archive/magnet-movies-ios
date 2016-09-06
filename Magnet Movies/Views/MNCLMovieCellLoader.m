//
//  MNCLMovieCellLoader.m
//  Magnet Movies
//
//  Created by Camilo Castro on 06-09-16.
//  Copyright © 2016 Magnet SPA. All rights reserved.
//

#import "MNCLMovieCellLoader.h"
#import "MNCLMovieModel.h"
#import "MNCLMovieCell.h"

@implementation MNCLMovieCellLoader

+ (CGFloat) heightForMovie:(nonnull MNCLMovieModel *) movie {
    
    // Provides a flexible way for returning different cell heights
    // depending on the movie
    
    return [MNCLMovieCell cellHeight];
}

+ (nonnull UITableViewCell *) cellForMovie: (nonnull MNCLMovieModel *) movie
                               inTableView:(nonnull UITableView *) tableView
                               atIndexPath: (nonnull NSIndexPath *) indexPath {
    
    // Here we could put more complex logic
    // for loading the cells like
    // different cells for categories
    // and other stuff
    
    MNCLMovieCell * cell = [tableView
                            dequeueReusableCellWithIdentifier:[MNCLMovieCell cellIdentifier]
                                                           forIndexPath:indexPath];
    
    [cell initWithMovie:movie];
    [cell setNeedsDisplay];
    
    return cell;
}
@end
