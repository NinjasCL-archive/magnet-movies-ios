//
//  MNCLMoviesArrayMantle.m
//  Magnet Movies
//
//  Created by Camilo Castro on 06-09-16.
//  Copyright © 2016 Magnet SPA. All rights reserved.
//

#import "MNCLMoviesArrayMantle.h"
#import "MNCLMovieItemMantle.h"

@implementation MNCLMoviesArrayMantle

@synthesize items = _items;

#pragma mark - MTLJSONSerializing

+ (NSDictionary *) JSONKeyPathsByPropertyKey {
    return @{
             @"items" : @"results",
             @"page" : @"page",
             @"totalPages" : @"total_pages",
             @"totalResults" : @"total_results"
    };
}

#pragma mark - Value Transformers

+ (NSValueTransformer *) itemsJSONTransformer {
    return [MTLJSONAdapter
            arrayTransformerWithModelClass:MNCLMovieItemMantle.class];
}



@end
