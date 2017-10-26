//
//  MoviesListViewController.h
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MoviesListViewInput.h"

@class MWSFilm;

@protocol MoviesListViewOutput;

@interface MoviesListViewController : UIViewController<MoviesListViewInput>

@property(nonatomic, strong) id<MoviesListViewOutput> output;
@property(nonatomic) MWSFilm * film;

@end
