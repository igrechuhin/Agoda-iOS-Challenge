//
//  MoviesListInteractor.h
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MWSInteractor.h"
#import "MWSMoviesListApi.h"

@protocol MWSMoviesProvider;

@interface MoviesListInteractor : MWSInteractor<MWSMoviesListInteractorApi>

- (instancetype)initWithMoviesProvider:(id<MWSMoviesProvider>)provider;

@end
