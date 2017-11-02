//
//  MWSModule.m
//  MovieWebService
//
//  Created by Ilya Grechuhin on 27.10.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "MWSModule.h"
#import "MWSDisplayData.h"
#import "MWSInteractor.h"
#import "MWSPresenter.h"
#import "MWSRouter.h"
#import "MWSView.h"

@interface MWSModule ()

@property(nonatomic, readwrite) MWSView * view;
@property(nonatomic, readwrite) MWSInteractor * interactor;
@property(nonatomic, readwrite) MWSPresenter * presenter;
@property(nonatomic, readwrite) MWSRouter * router;
@property(nonatomic, readwrite) MWSDisplayData * displayData;

@end

@implementation MWSModule

+ (MWSModule *)buildWithView:(MWSView *)view
                  interactor:(MWSInteractor *)interactor
                   presenter:(MWSPresenter *)presenter
                      router:(MWSRouter *)router
                 displayData:(MWSDisplayData *)displayData
{
  MWSModule * module = [[MWSModule alloc] init];

  module.view = view;
  module.interactor = interactor;
  module.presenter = presenter;
  module.router = router;
  module.displayData = displayData;

  view.presenter = presenter;
  view.displayData = displayData;

  interactor.presenter = presenter;

  presenter.router = router;
  presenter.interactor = interactor;
  presenter.view = view;

  router.presenter = presenter;

  return module;
}

@end

@implementation MWSModule (Mock)

- (void)injectMockView:(MWSView *)view
{
  self.view = view;
  view.presenter = self.presenter;
  view.displayData = self.displayData;
  self.presenter.view = view;
}

- (void)injectMockInteractor:(MWSInteractor *)interactor
{
  self.interactor = interactor;
  interactor.presenter = self.presenter;
  self.presenter.interactor = interactor;
}

- (void)injectMockPresenter:(MWSPresenter *)presenter
{
  self.presenter = presenter;
  presenter.view = self.view;
  presenter.interactor = self.interactor;
  presenter.router = self.router;
  self.view.presenter = presenter;
  self.interactor.presenter = presenter;
  self.router.presenter = presenter;
}

- (void)injectMockRouter:(MWSRouter *)router
{
  self.router = router;
  router.presenter = self.presenter;
  self.presenter.router = router;
}

- (void)injectMockDisplayData:(MWSDisplayData *)displayData
{
  self.displayData = displayData;
  self.view.displayData = displayData;
}

@end
