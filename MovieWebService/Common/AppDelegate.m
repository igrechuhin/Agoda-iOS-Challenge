//
//  AppDelegate.m
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "AppDelegate.h"
#import "MWSDefaultMoviesProvider.h"
#import "MWSMoviesListModule.h"
#import "MWSRouter.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  if ([NSProcessInfo processInfo].environment[@"XCInjectBundleInto"] != nil)
    return NO;

  [self showMainWindow];
  return YES;
}

- (void)showMainWindow
{
  MWSModule * moviesList =
      [MWSMoviesListModule buildWithMoviesProvider:[[MWSDefaultMoviesProvider alloc] init]];
  UIWindow * window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
  [moviesList.router showInWindow:window embedInNavController:YES makeKeyAndVisible:YES];
  self.window = window;
}

@end
