//
//  MWSPresenterProtocol.h
//  MovieWebService
//
//  Created by Ilya Grechuhin on 27.10.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

@class MWSView;
@class MWSInteractor;
@class MWSRouter;

@protocol MWSPresenterProtocol<NSObject>

@property(weak, nonatomic) MWSView * view;
@property(nonatomic) MWSInteractor * interactor;
@property(nonatomic) MWSRouter * router;

- (void)viewHasLoaded;
- (void)viewIsAboutToAppear;
- (void)viewHasAppeared;
- (void)viewIsAboutToDisappear;
- (void)viewHasDisappeared;

@end
