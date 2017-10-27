//
//  MoviesListViewController.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MoviesListViewController.h"
#import "MWSDefaultFilmsProvider.h"
#import "MWSFilm.h"
#import "MoviesListViewOutput.h"

@implementation MoviesListViewController

#pragma mark - Life cycle

- (void)viewDidLoad
{
  [super viewDidLoad];
  [MWSDefaultFilmsProvider getFilm:0 withCallback:^(MWSFilm * film) {
    [self.output setData:film];
  }];

  [self.output didTriggerViewReadyEvent];
  [self.output setViewForSetup:self.view];
}

#pragma mark - MoviesListViewInput

- (void)setupInitialState
{
  self.navigationItem.title = @"RootViewController";
  self.view.backgroundColor = [UIColor whiteColor];
}

@end
