//
//  AppDelegate.h
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

@class MWSFilm;

@interface AppDelegate : UIResponder<UIApplicationDelegate>

@property(nonatomic) UIWindow * window;
@property(nonatomic) UINavigationController * navigationController;

- (void)getFilmWithCallback:(void (^)(MWSFilm * film))callback;

@end
