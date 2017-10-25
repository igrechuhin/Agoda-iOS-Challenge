//
//  MoviesListPresenter.h
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MoviesListInteractorOutput.h"
#import "MoviesListModuleInput.h"
#import "MoviesListViewOutput.h"

@protocol MoviesListViewInput;
@protocol MoviesListInteractorInput;
@protocol MoviesListRouterInput;

@interface MoviesListPresenter
  : NSObject<MoviesListModuleInput, MoviesListViewOutput, MoviesListInteractorOutput>

@property(nonatomic, strong) id<MoviesListViewInput> view;
@property(nonatomic, strong) id<MoviesListInteractorInput> interactor;
@property(nonatomic, strong) id<MoviesListRouterInput> router;

@end
