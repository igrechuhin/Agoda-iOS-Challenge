//
//  MWSRouterProtocol.h
//  MovieWebService
//
//  Created by Ilya Grechuhin on 27.10.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

@class MWSPresenter;

@protocol MWSPresenterProtocol;

@protocol MWSRouterProtocol <NSObject>

@property(weak, nonatomic) MWSPresenter * presenter;

- (void)showInWindow:(UIWindow *)window embedInNavController:(BOOL)embedInNavController makeKeyAndVisible:(BOOL)makeKeyAndVisible;
- (void)showFrom:(UIViewController *)from embedInNavController:(BOOL)embedInNavController;

@end
