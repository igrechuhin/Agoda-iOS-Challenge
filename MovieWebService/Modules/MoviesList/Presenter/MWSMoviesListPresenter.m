//
//  MoviesListPresenter.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MWSMoviesListPresenter.h"
#import "MWSFilm.h"
#import "MWSMoviesListInteractor.h"
#import "MWSView.h"

@interface MoviesListPresenter ()

@property(copy, nonatomic) NSArray<MWSFilm *> * movies;

@end

@implementation MoviesListPresenter

#pragma mark - Helpers

- (void)fetchMovies
{
  MWSInteractor<MWSMoviesListInteractorApi> * interactor = self.moviesListInteractor;
  __weak typeof(self) wSelf = self;
  [interactor getMoviesWithCallback:^(NSArray<MWSFilm *> * movies) {
    dispatch_async(dispatch_get_main_queue(), ^{
      __strong typeof(wSelf) sSelf = wSelf;
      if (!sSelf)
        return;
      sSelf.movies = movies;

      MWSView<MWSMoviesListViewApi> * view = sSelf.moviesListView;
      [view dataUpdated];
    });
  }];
}

#pragma mark - MWSMoviesListPresenterApi

- (NSInteger)moviesCount { return [self.movies count]; }

- (MWSFilm *)getMovieAtIndex:(NSInteger)index
{
  NSArray<MWSFilm *> * movies = self.movies;
  NSAssert(index >= 0 && index < movies.count, @"Invalid movie index");
  return movies[index];
}

#pragma mark - MWSPresenterProtocol

- (void)viewHasLoaded
{
  MWSView<MWSMoviesListViewApi> * view = self.moviesListView;
  [view setup];
  [self fetchMovies];
}

#pragma mark - Properties

- (MWSView<MWSMoviesListViewApi> *)moviesListView
{
  MWSView * view = super.view;
  NSAssert([view conformsToProtocol:@protocol(MWSMoviesListViewApi)], @"Invalid view type");
  return (MWSView<MWSMoviesListViewApi> *)(view);
}

- (MWSInteractor<MWSMoviesListInteractorApi> *)moviesListInteractor
{
  MWSInteractor * interactor = super.interactor;
  NSAssert([interactor conformsToProtocol:@protocol(MWSMoviesListInteractorApi)],
           @"Invalid interactor type");
  return (MWSInteractor<MWSMoviesListInteractorApi> *)(interactor);
}

@end
