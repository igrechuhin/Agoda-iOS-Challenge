//
//  MoviesListViewControllerTests.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MoviesListViewController.h"

#import "MoviesListViewOutput.h"

@interface MoviesListViewControllerTests : XCTestCase

@property (nonatomic, strong) MoviesListViewController *controller;

@property (nonatomic, strong) id mockOutput;

@end

@implementation MoviesListViewControllerTests

- (void)setUp {
    [super setUp];

    self.controller = [[MoviesListViewController alloc] init];

    self.controller.output = self.mockOutput;
}

- (void)tearDown {
    self.controller = nil;

    self.mockOutput = nil;

    [super tearDown];
}

- (void)testThatControllerNotifiesPresenterOnDidLoad {
	// given

	// when
	[self.controller viewDidLoad];

	// then
}

#pragma mark - Тестирование методов интерфейса

#pragma mark - Тестирование методов MoviesListViewInput

@end
