//
//  MWSMoviesListItemModel.m
//  MovieWebService
//
//  Created by Ilya Grechuhin on 31.10.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "MWSMoviesListItemModel.h"

@implementation MWSMoviesListItemModel

- (instancetype)initWithMovieName:(NSString *)movieName
                      releaseDate:(NSString *)releaseDate
                       mpaaRating:(NSString *)mpaaRating
                           rating:(NSString *)rating
{
  self = [super init];
  if (self)
  {
    _movieName = movieName;
    _releaseDate = releaseDate;
    _mpaaRating = mpaaRating;
    _rating = rating;
  }

  return self;
}

@end
