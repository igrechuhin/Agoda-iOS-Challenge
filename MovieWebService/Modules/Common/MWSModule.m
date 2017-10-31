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
