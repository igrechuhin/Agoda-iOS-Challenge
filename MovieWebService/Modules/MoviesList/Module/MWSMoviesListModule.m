//
//  MWSMoviesListModule.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MWSMoviesListModule.h"
#import "MWSMoviesListView.h"
#import "MWSMoviesListInteractor.h"
#import "MWSMoviesListPresenter.h"
#import "MWSMoviesListRouter.h"
#import "MWSMoviesListDisplayData.h"

@implementation MWSMoviesListModule

+ (MWSModule *)build
{
  return [self buildWithView:[[MoviesListViewController alloc] init]
                  interactor:[[MoviesListInteractor alloc] init]
                   presenter:[[MoviesListPresenter alloc] init]
                      router:[[MoviesListRouter alloc] init]
                 displayData:[[MWSMoviesListDisplayData alloc] init]];
}

@end
