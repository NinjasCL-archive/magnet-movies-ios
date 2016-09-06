//
//  MNCLMovieCell.m
//  Magnet Movies
//
//  Created by Camilo Castro on 06-09-16.
//  Copyright © 2016 Magnet SPA. All rights reserved.
//

#import "MNCLMovieCell.h"
#import "MNCLMovieModel.h"
#import "MNCLMovieItemMantle.h"

#import "NJSLogger.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface MNCLMovieCell()

@property (weak, nonatomic) IBOutlet UIImageView *backdropImageView;

@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *movieDateLabel;

@property (weak, nonatomic) IBOutlet UILabel *popularityLabel;

@property (weak, nonatomic) IBOutlet UILabel *averageLabel;

@end

@implementation MNCLMovieCell

- (void) initWithMovie: (MNCLMovieModel *) movie {
    
    DDLogInfo(@"Cell Loaded With Movie");
    DDLogDebug(@"Movie %@", movie);
    
    self.movie = movie;
    
    self.movieTitleLabel.text = self.movie.title;
    
    MNCLMovieItemMantle * mantle = self.movie.mantle;
    
    self.movieDateLabel.text = mantle.releasedAtFormatted;
    
    self.popularityLabel.text = [NSString stringWithFormat:@"%@: %1.1f", NSLocalizedString(@"Popularity", @"How much popular is the movie item."), mantle.popularity.floatValue];
    
    self.averageLabel.text =  [NSString stringWithFormat:@"%@: %1.1f", NSLocalizedString(@"Vote Average", @"What was the average vote for the movie item."), mantle.voteAverage.floatValue];
    
    self.backgroundColor = [UIColor whiteColor];
    
    [self.backdropImageView sd_setImageWithURL:mantle.backdropImageURL completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        DDLogVerbose(@"Loaded %@", imageURL);
        
        if (error) {
            DDLogWarn(@"%@", error);
        }
    }];
    
    // We need to release it so the information
    // will render properly in the cells
    mantle = nil;
}

#pragma mark - Table View Cell Protocol
+ (nonnull NSString *) cellIdentifier {
    
    static NSString * identifier = @"MNCLMovieCell";
    
    return identifier;
}

+ (CGFloat) cellHeight {
    return 100;
}

@end
