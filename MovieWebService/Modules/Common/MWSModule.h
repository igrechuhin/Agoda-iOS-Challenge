//
//  MWSModule.h
//  MovieWebService
//
//  Created by Ilya Grechuhin on 27.10.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

@class MWSView;
@class MWSInteractor;
@class MWSPresenter;
@class MWSRouter;
@class MWSDisplayData;

@interface MWSModule : NSObject

@property(nonatomic, readonly) MWSView * view;
@property(nonatomic, readonly) MWSInteractor * interactor;
@property(nonatomic, readonly) MWSPresenter * presenter;
@property(nonatomic, readonly) MWSRouter * router;
@property(nonatomic, readonly) MWSDisplayData * displayData;

+ (MWSModule *)buildWithView:(MWSView *)view
                  interactor:(MWSInteractor *)interactor
                   presenter:(MWSPresenter *)presenter
                      router:(MWSRouter *)router
                 displayData:(MWSDisplayData *)displayData;

@end
