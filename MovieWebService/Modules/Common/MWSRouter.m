//
//  MWSRouter.m
//  MovieWebService
//
//  Created by Ilya Grechuhin on 27.10.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "MWSRouter.h"
#import "MWSPresenter.h"
#import "MWSView.h"

@implementation MWSRouter

- (void)showInWindow:(UIWindow *)window
    embedInNavController:(BOOL)embedInNavController
       makeKeyAndVisible:(BOOL)makeKeyAndVisible
{
  UIViewController * view =
      embedInNavController ? [self embedInNavigationController] : self.presenter.view;
  window.rootViewController = view;
  if (makeKeyAndVisible)
    [window makeKeyAndVisible];
}

- (void)showFrom:(UIViewController *)from embedInNavController:(BOOL)embedInNavController
{
  UIViewController * view =
      embedInNavController ? [self embedInNavigationController] : self.presenter.view;
  [from showViewController:view sender:nil];
}

- (UINavigationController *)embedInNavigationController
{
  MWSView * view = self.presenter.view;
  UINavigationController * navigationController = view.navigationController;
  if (!navigationController)
    navigationController = view.parentViewController.navigationController;
  if (!navigationController)
    navigationController = [[UINavigationController alloc] initWithRootViewController:view];
  return navigationController;
}

@end
