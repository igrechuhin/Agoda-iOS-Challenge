//
//  MoviesListInteractor.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MWSMoviesListInteractor.h"
#import "MWSDefaultMoviesProvider.h"

@interface MoviesListInteractor ()

@property(nonatomic) id<MWSMoviesProvider> moviesProvider;

@end

@implementation MoviesListInteractor

- (instancetype)initWithMoviesProvider:(id<MWSMoviesProvider>)provider
{
  self = [super init];
  if (self)
    _moviesProvider = provider;
  return self;
}

- (void)getMoviesWithCallback:(MWSFetchMoviesCallback)callback
{
  [self.moviesProvider getMovieWithID:0
                         withCallback:^(MWSMovie * movie) {
                           NSArray<MWSMovie *> * movies = @[movie];
                           callback(movies);
                         }];
}

@end
