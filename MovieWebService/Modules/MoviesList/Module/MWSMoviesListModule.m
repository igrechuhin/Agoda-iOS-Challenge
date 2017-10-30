//
//  MWSMoviesListModule.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MWSMoviesListModule.h"
#import "MWSMoviesListDisplayData.h"
#import "MWSMoviesListInteractor.h"
#import "MWSMoviesListPresenter.h"
#import "MWSMoviesListRouter.h"
#import "MWSMoviesListView.h"

@implementation MWSMoviesListModule

+ (MWSModule *)build
{
  return [self buildWithView:[[MWSMoviesListView alloc] init]
                  interactor:[[MoviesListInteractor alloc] init]
                   presenter:[[MoviesListPresenter alloc] init]
                      router:[[MoviesListRouter alloc] init]
                 displayData:[[MWSMoviesListDisplayData alloc] init]];
}

@end
