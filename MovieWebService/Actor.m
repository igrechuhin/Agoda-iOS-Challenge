//
//  Actor.m
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "Actor.h"

@implementation Actor

- (instancetype)initWithData:(NSDictionary *)data film:(MWSFilm *)film
{
  self = [super initWithData:data film:film];
  if (self)
  {
    self.screenName = [data objectForKey:@"screenName"];
  }
  return self;
}

@end
