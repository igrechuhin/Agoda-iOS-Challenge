//
//  MWSActor.m
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "MWSActor.h"

@interface MWSActor ()

@property(copy, nonatomic, readwrite) NSString * screenName;

@end

@implementation MWSActor

- (instancetype)initWithData:(NSDictionary *)data film:(MWSFilm *)film
{
  self = [super initWithData:data film:film];
  if (self)
    [self parseScreenName:data];
  return self;
}

- (void)parseScreenName:(NSDictionary *)data
{
  NSString * screenName = [data objectForKey:@"screenName"];
  NSAssert(screenName != nil, @"Screen name data is missing");
  NSAssert([screenName isKindOfClass:[NSString class]], @"Invalid screen name data type");
  self.screenName = screenName;
}

@end
