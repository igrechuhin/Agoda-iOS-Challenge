//
//  MWSDefaultMoviesProvider.m
//  MovieWebService
//
//  Created by Ilya Grechuhin on 27.10.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "MWSDefaultMoviesProvider.h"
#import "MWSMovie.h"

@implementation MWSDefaultMoviesProvider

- (void)getMovieWithID:(NSInteger)movieID withCallback:(MWSMovieCallback)callback
{
  // movieID is ignored, but for real case we need to specify "which movie" we want to get.

  dispatch_async(dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), ^{
    NSDictionary * data = @{
      @"mpaa": @3,
      @"languages": @[@"English", @"Thai"],
      @"nominated": @YES,
      @"releaseDate": @1350000000,
      @"actors": @[@{
        @"dateOfBirth": @-436147200,
        @"nominated": @YES,
        @"name": @"Bryan Cranston",
        @"screenName": @"Jack Donnell",
        @"biography":
            @"Bryan Lee Cranston is an American actor, voice actor, writer and director."
      }],
      @"name": @"Argo",
      @"imdbRating": @7.8,
      @"director": @{
        @"dateOfBirth": @82684800,
        @"nominated": @YES,
        @"name": @"Ben Affleck",
        @"biography": @"Benjamin Geza Affleck was born on August 15, 1972 in Berkeley, California, "
                      @"USA but raised in Cambridge, Massachusetts, USA."
      }
    };

    MWSMovie * movie = [[MWSMovie alloc] initWithData:data];
    callback(movie);
  });
}

@end
