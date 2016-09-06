//
//  MNCLMovieItemMantle.m
//  Magnet Movies
//
//  Created by Camilo Castro on 06-09-16.
//  Copyright © 2016 Magnet SPA. All rights reserved.
//

#import "MNCLMovieItemMantle.h"
#import "NJSEndpoint+MNCLMovies.h"

#import <YLMoment/YLMoment.h>

@implementation MNCLMovieItemMantle

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"uid" : @"id",
             @"adultsOnly" : @"adult",
             @"hasVideo" : @"video",
             @"backdropImagePath" : @"backdrop_path",
             @"posterImagePath" : @"poster_path",
             @"title" : @"title",
             @"originalTitle" : @"original_title",
             @"originalLanguage" : @"original_language",
             @"overview" : @"overview",
             @"voteCount" : @"vote_count",
             @"voteAverage" : @"vote_average",
             @"popularity" : @"popularity",
             @"releasedAt" : @"release_date"
    };
}

- (nullable NSURL *) backdropImageURL {
    return [NJSEndpoint movieImageURLForPath:self.backdropImagePath];
}

- (nullable NSURL *) posterImageURL {
    return [NJSEndpoint movieImageURLForPath:self.posterImagePath];
}

- (NSString *) releasedAtFormatted {
    
    YLMoment * moment = [YLMoment
                         momentWithDateAsString:self.releasedAt
                         format:@"yyyy-MM-dd"];
    
    [moment setLocale:[NSLocale localeWithLocaleIdentifier:NSLocalizedString(@"es_ES", @"NSLocale Identifier for Date Generation")]];
    
    return [moment
            format:NSLocalizedString(@"dd 'de' MMMM 'de' yyyy", @"Date Format For Date Generation")];
    
}


@end
