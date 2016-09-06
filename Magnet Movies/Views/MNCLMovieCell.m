//
//  MNCLMovieCell.m
//  Magnet Movies
//
//  Created by Camilo Castro on 06-09-16.
//  Copyright © 2016 Magnet SPA. All rights reserved.
//

#import "MNCLMovieCell.h"
#import "MNCLMovieModel.h"

#import "NJSLogger.h"

@implementation MNCLMovieCell

- (void) initWithMovie: (MNCLMovieModel *) movie {
    
    DDLogInfo(@"Cell Loaded With Movie");
    DDLogDebug(@"Movie %@", movie);
    
    self.movie = movie;
    self.textLabel.text = self.movie.mantle.title;
}

#pragma mark - Table View Cell Protocol
+ (nonnull NSString *) cellIdentifier {
    
    static NSString * identifier = @"MNCLMovieCell";
    
    return identifier;
}

+ (CGFloat) cellHeight {
    return 80;
}

@end
