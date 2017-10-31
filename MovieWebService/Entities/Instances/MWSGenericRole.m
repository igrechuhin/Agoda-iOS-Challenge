//
//  MWSGenericRole.m
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "MWSGenericRole.h"

@interface MWSGenericRole ()

@property(copy, nonatomic, readwrite) NSString * biography;
@property(copy, nonatomic, readwrite) NSString * name;
@property(nonatomic, readwrite) BOOL nominated;
@property(nonatomic, readwrite) NSDate * dateOfBirth;
@property(weak, nonatomic, readwrite) MWSMovie * movie;

@end

@implementation MWSGenericRole

- (instancetype)initWithData:(NSDictionary *)data movie:(MWSMovie *)movie
{
  self = [super init];
  if (self)
  {
    [self parseBiography:data];
    [self parseName:data];
    [self parseDateOfBirth:data];
    [self parseNominated:data];
  }
  return self;
}

- (void)parseBiography:(NSDictionary *)data
{
  NSString * biography = [data objectForKey:@"biography"];
  NSAssert(biography != nil, @"Biography data is missing");
  NSAssert([biography isKindOfClass:[NSString class]], @"Invalid biography data type");
  self.biography = biography;
}

- (void)parseName:(NSDictionary *)data
{
  NSString * name = [data objectForKey:@"name"];
  NSAssert(name != nil, @"Name data is missing");
  NSAssert([name isKindOfClass:[NSString class]], @"Invalid name data type");
  self.name = name;
}

- (void)parseDateOfBirth:(NSDictionary *)data
{
  NSNumber * dateOfBirth = [data objectForKey:@"dateOfBirth"];
  NSAssert(dateOfBirth != nil, @"Date of birth is missing");
  NSAssert([dateOfBirth isKindOfClass:[NSNumber class]], @"Invalid date of birth data type");
  if (dateOfBirth)
    self.dateOfBirth = [NSDate dateWithTimeIntervalSince1970:[dateOfBirth doubleValue]];
}

- (void)parseNominated:(NSDictionary *)data
{
  NSNumber * nominated = [data objectForKey:@"nominated"];
  NSAssert(nominated != nil, @"Nominated data is missing");
  NSAssert([nominated isKindOfClass:[NSNumber class]], @"Invalid nominated data type");
  self.nominated = [nominated boolValue];
}

@end
