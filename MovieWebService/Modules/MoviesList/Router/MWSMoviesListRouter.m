//
//  MoviesListRouter.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MWSMoviesListRouter.h"
#import "MWSModule.h"
#import "MovieWebService-Swift.h"

@implementation MoviesListRouter

- (void)showDetailsForMovie:(MWSMovie *)movie
{
  MWSModule * details = [DetailsModule buildWithMovie:movie];
  [details.router showFrom:self.presenter.view embedInNavController:NO];
}

@end
