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
#import "MWSMoviesListItemModel.h"
#import "MWSView.h"
#import "MovieWebService-Swift.h"

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

- (MWSFilm *)movieAtIndex:(NSInteger)index
{
  NSArray<MWSFilm *> * movies = self.movies;
  NSAssert(index >= 0 && index < movies.count, @"Invalid movie index");
  return movies[index];
}

#pragma mark - MWSMoviesListPresenterApi

- (NSInteger)moviesCount { return [self.movies count]; }

- (MWSMoviesListItemModel *)getItemAtIndex:(NSInteger)index
{
  MWSFilm * movie = [self movieAtIndex:index];

  NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
  dateFormatter.dateStyle = NSDateFormatterMediumStyle;
  dateFormatter.timeStyle = NSDateFormatterNoStyle;
  NSString * releaseDate = [dateFormatter stringFromDate:movie.releaseDate];

  NSString * mpaaRating = @"";
  switch (movie.mpaa)
  {
  case MWSMpaaG: mpaaRating = @"G"; break;
  case MWSMpaaPG: mpaaRating = @"PG"; break;
  case MWSMpaaPG13: mpaaRating = @"PG13"; break;
  case MWSMpaaR: mpaaRating = @"R"; break;
  case MWSMpaaNC17: mpaaRating = @"NC17"; break;
  default: NSAssert(false, @"Unsupported MPAA rating"); break;
  }

  NSString * rating = [[NSNumber numberWithFloat:movie.imdbRating] stringValue];

  return [[MWSMoviesListItemModel alloc] initWithFilmName:movie.name
                                              releaseDate:releaseDate
                                               mpaaRating:mpaaRating
                                                   rating:rating];
}

- (void)itemSelectedAtIndex:(NSInteger)index
{
  MWSFilm * movie = [self movieAtIndex:index];

  MWSModule * details = [DetailsModule buildWithMovie:movie];
  [details.router showFrom:self.view embedInNavController:NO];
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
