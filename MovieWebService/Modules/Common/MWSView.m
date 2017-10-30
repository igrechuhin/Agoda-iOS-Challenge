//
//  MWSView.m
//  MovieWebService
//
//  Created by Ilya Grechuhin on 27.10.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "MWSView.h"
#import "MWSPresenter.h"

@implementation MWSView

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self.presenter viewHasLoaded];
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  [self.presenter viewIsAboutToAppear];
}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];
  [self.presenter viewHasAppeared];
}

- (void)viewWillDisappear:(BOOL)animated
{
  [super viewWillDisappear:animated];
  [self.presenter viewIsAboutToDisappear];
}

- (void)viewDidDisappear:(BOOL)animated
{
  [super viewDidDisappear:animated];
  [self.presenter viewHasDisappeared];
}

@end
