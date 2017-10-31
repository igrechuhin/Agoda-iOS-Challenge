//
//  MoviesListInteractor.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MWSMoviesListInteractor.h"
#import "MWSDefaultMoviesProvider.h"

@implementation MoviesListInteractor

- (void)getMoviesWithCallback:(MWSFetchMoviesCallback)callback
{
  [MWSDefaultMoviesProvider getMovieWithID:0
                              withCallback:^(MWSMovie * movie) {
                                NSArray<MWSMovie *> * movies = @[movie];
                                callback(movies);
                              }];
}

@end
