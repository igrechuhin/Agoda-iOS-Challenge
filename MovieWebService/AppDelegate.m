//
//  AppDelegate.m
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "AppDelegate.h"
#import "MoviesListBuilder.h"

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
  MoviesListBuilder * moviesListBuilder = [[MoviesListBuilder alloc] init];
  UIViewController * moviesListViewController = [moviesListBuilder build];

  UINavigationController * navigationController = [[UINavigationController alloc] init];
  [navigationController setViewControllers:@[moviesListViewController] animated:NO];
  self.rootNavigationController = navigationController;

  UIWindow * window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
  window.rootViewController = navigationController;
  [window makeKeyAndVisible];
  self.window = window;
}

@end
