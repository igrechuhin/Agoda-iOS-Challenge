//
//  MoviesListAssembly.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MoviesListBuilder.h"

#import "MoviesListViewController.h"
#import "MoviesListInteractor.h"
#import "MoviesListPresenter.h"
#import "MoviesListRouter.h"
#import "MWSMoviesListDisplayData.h"


@implementation MoviesListBuilder

+ (MWSModule *)build
{
  return [self buildWithView:[[MoviesListViewController alloc] init]
                  interactor:[[MoviesListInteractor alloc] init]
                   presenter:[[MoviesListPresenter alloc] init]
                      router:[[MoviesListRouter alloc] init]
                 displayData:[[MWSMoviesListDisplayData alloc] init]];
}

@end
