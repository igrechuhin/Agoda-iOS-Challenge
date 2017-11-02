//
//  MoviesListPresenter.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MWSMoviesListPresenter.h"
#import "MWSMovie.h"
#import "MWSMoviesListInteractor.h"
#import "MWSMoviesListItemModel.h"
#import "MWSMoviesListRouter.h"
#import "MWSView.h"

@interface MoviesListPresenter ()

@property(copy, nonatomic) NSArray<MWSMovie *> * movies;

@end

@implementation MoviesListPresenter

#pragma mark - Helpers

- (void)fetchMovies
{
  MWSInteractor<MWSMoviesListInteractorApi> * interactor = self.moviesListInteractor;
  __weak typeof(self) wSelf = self;
  [interactor getMoviesWithCallback:^(NSArray<MWSMovie *> * movies) {
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

- (MWSMovie *)movieAtIndex:(NSInteger)index
{
  NSArray<MWSMovie *> * movies = self.movies;
  NSAssert(index >= 0 && index < movies.count, @"Invalid movie index");
  return movies[index];
}

#pragma mark - MWSMoviesListPresenterApi

- (NSInteger)moviesCount { return [self.movies count]; }

- (MWSMoviesListItemModel *)getItemAtIndex:(NSInteger)index
{
  MWSMovie * movie = [self movieAtIndex:index];

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

  return [[MWSMoviesListItemModel alloc] initWithMovieName:movie.name
                                               releaseDate:releaseDate
                                                mpaaRating:mpaaRating
                                                    rating:rating];
}

- (void)itemSelectedAtIndex:(NSInteger)index
{
  MWSRouter<MWSMoviesListRouterApi> * router = self.moviesListRouter;
  MWSMovie * movie = [self movieAtIndex:index];

  [router showDetailsForMovie:movie];
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

- (MWSRouter<MWSMoviesListRouterApi> *)moviesListRouter
{
  MWSRouter * router = super.router;
  NSAssert([router conformsToProtocol:@protocol(MWSMoviesListRouterApi)], @"Invalid router type");
  return (MWSRouter<MWSMoviesListRouterApi> *)(router);
}

@end
