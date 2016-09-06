//
//  MNCLMovieItemMantle.h
//  Magnet Movies
//
//  Created by Camilo Castro on 06-09-16.
//  Copyright © 2016 Magnet SPA. All rights reserved.
//

#import <Mantle/Mantle.h>

/*!
 *  @brief Holds the single Movie Item.
 *
 * Example JSON 
 ```
 { adult = 0;
 "backdrop_path" = "/sFQ10h9DnjOYIF4HjtLQuZ8pnb4.jpg";
 "genre_ids" =             (
 16,
 10751
 );
 id = 13042;
 "original_language" = en;
 "original_title" = Presto;
 overview = "Dignity. Poise. Mystery. We expect nothing less from the great turn-of-the-century magician, Presto. But when Presto neglects to feed his rabbit one too many times, the magician finds he isn't the only one with a few tricks up his sleeve!";
 popularity = "2.197704";
 "poster_path" = "/A2rxR8g3y6kcjIoR2fcwtq9eppc.jpg";
 "release_date" = "2008-06-18";
 title = Presto;
 video = 0;
 "vote_average" = "8.02";
 "vote_count" = 264;
 }
 ```
 */
@interface MNCLMovieItemMantle : MTLModel <MTLJSONSerializing>

@property (nonatomic, nullable) NSNumber * uid;

@property (nonatomic) BOOL adultsOnly;

@property (nonatomic) BOOL hasVideo;

@property (nonatomic, nullable) NSString * backdropImagePath;

@property (nonatomic, nullable) NSURL * backdropImageURL;

@property (nonatomic, nullable) NSString * posterImagePath;

@property (nonatomic, nullable) NSURL * posterImageURL;

@property (nonatomic, nullable) NSString * title;

@property (nonatomic, nullable) NSString * originalTitle;

@property (nonatomic, nullable) NSString * originalLanguage;

@property (nonatomic, nullable) NSString * overview;

@property (nonatomic, nullable) NSNumber * voteCount;

@property (nonatomic, nullable) NSNumber * voteAverage;

@property (nonatomic, nullable) NSNumber * popularity;

@property (nonatomic, nullable) NSString * releasedAt;

@end
