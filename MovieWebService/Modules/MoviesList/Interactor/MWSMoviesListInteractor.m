//
//  MoviesListInteractor.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MWSMoviesListInteractor.h"
#import "MWSDefaultFilmsProvider.h"

@implementation MoviesListInteractor

- (void)getMoviesWithCallback:(MWSFetchMoviesCallback)callback
{
  [MWSDefaultFilmsProvider getFilm:0
                      withCallback:^(MWSFilm * film) {
                        NSArray<MWSFilm *> * movies = @[film];
                        callback(movies);
                      }];
}

@end
