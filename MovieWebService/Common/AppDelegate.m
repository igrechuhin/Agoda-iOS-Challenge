//
//  AppDelegate.m
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "AppDelegate.h"
#import "MWSMoviesListModule.h"
#import "MWSRouter.h"

@interface AppDelegate()

@property(nonatomic, readwrite) UINavigationController * rootNavigationController;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  [self showMainWindow];
  return YES;
}

- (void)showMainWindow
{
  MWSModule * moviesList = [MWSMoviesListModule build];
  UIWindow * window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
  [moviesList.router showInWindow:window embedInNavController:YES makeKeyAndVisible:YES];
  self.window = window;
}

@end
