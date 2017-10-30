//
//  MWSMoviesListViewTests.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MWSMoviesListView.h"

#import "MoviesListViewOutput.h"

@interface MWSMoviesListViewTests : XCTestCase

@property(nonatomic, strong) MWSMoviesListView * controller;

@property(nonatomic, strong) id mockOutput;

@end

@implementation MWSMoviesListViewTests

- (void)setUp
{
  [super setUp];

  self.controller = [[MWSMoviesListView alloc] init];

  self.controller.output = self.mockOutput;
}

- (void)tearDown
{
  self.controller = nil;

  self.mockOutput = nil;

  [super tearDown];
}

- (void)testThatControllerNotifiesPresenterOnDidLoad
{
  // given

  // when
  [self.controller viewDidLoad];

  // then
}

#pragma mark - Тестирование методов интерфейса

#pragma mark - Тестирование методов MoviesListViewInput

@end
