//
//  MWSFilm.m
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "MWSFilm.h"
#import "Actor.h"
#import "Director.h"

@interface MWSFilm()

@property(copy, nonatomic, readwrite) NSArray<Actor *> * actors;
@property(copy, nonatomic, readwrite) NSArray<NSString *> * languages;
@property(copy, nonatomic, readwrite) NSString * name;
@property(nonatomic, readwrite) BOOL nominated;
@property(nonatomic, readwrite) Director * director;
@property(nonatomic, readwrite) MWSMpaa mpaa;
@property(nonatomic, readwrite) NSDate * releaseDate;
@property(nonatomic, readwrite) float imdbRating;

@end

@implementation MWSFilm

- (instancetype)initWithData:(NSDictionary *)data
{
  self = [super init];
  if (self)
  {
    [self parseActors:data];
    [self parseLanguages:data];
    [self parseName:data];
    [self parseNominated:data];
    [self parseDirector:data];
    [self parseMPAA:data];
    [self parseReleaseDate:data];
    [self parseIMDBRating:data];
  }
  return self;
}

- (void)parseActors:(NSDictionary *)data
{
  NSArray<NSDictionary *> * actorsData = [data objectForKey:@"actors"];
  NSAssert(actorsData != nil, @"Actors data is missing");
  NSMutableArray * actors = [@[] mutableCopy];
  if (actorsData)
  {
    NSAssert([actorsData isKindOfClass:[NSArray class]], @"Invalid actors data type");
    for (NSDictionary * actorData in actorsData)
    {
      NSAssert([actorData isKindOfClass:[NSDictionary class]], @"Invalid actor data type");
      Actor * actor = [[Actor alloc] initWithData:actorData film:self];
      [actors addObject:actor];
    }
  }
  self.actors = actors;
}

- (void)parseLanguages:(NSDictionary *)data
{
  NSArray<NSString *> * languages = [data objectForKey:@"languages"];
  NSAssert(languages != nil, @"Languages data is missing");
  if (!languages || [languages count] == 0)
  {
    self.languages = @[];
  }
  else
  {
    NSAssert([languages isKindOfClass:[NSArray class]], @"Invalid languages data type");
    NSAssert([languages.firstObject isKindOfClass:[NSString class]], @"Invalid language data type");
    self.languages = languages;
  }
}

- (void)parseName:(NSDictionary *)data
{
  NSString * name = [data objectForKey:@"name"];
  NSAssert(name != nil, @"Name data is missing");
  NSAssert([name isKindOfClass:[NSString class]], @"Invalid name data type");
  self.name = name;
}

- (void)parseNominated:(NSDictionary *)data
{
  NSNumber * nominated = [data objectForKey:@"nominated"];
  NSAssert(nominated != nil, @"Nominated data is missing");
  NSAssert([nominated isKindOfClass:[NSNumber class]], @"Invalid nominated data type");
  self.nominated = [nominated boolValue];
}

- (void)parseDirector:(NSDictionary *)data
{
  NSDictionary * director = [data objectForKey:@"director"];
  NSAssert(director != nil, @"Director data is missing");
  NSAssert([director isKindOfClass:[NSDictionary class]], @"Invalid director data type");
  if (director)
    self.director = [[Director alloc] initWithData:director];
}

- (void)parseMPAA:(NSDictionary *)data
{
  NSNumber * mpaa = [data objectForKey:@"mpaa"];
  NSAssert(mpaa != nil, @"MPAA data is missing");
  NSAssert([mpaa isKindOfClass:[NSNumber class]], @"Invalid MPAA data type");
  NSInteger mpaaValue = [mpaa integerValue];
  switch (mpaaValue)
  {
  case MWSMpaaG:
  case MWSMpaaPG:
  case MWSMpaaPG13:
  case MWSMpaaR:
  case MWSMpaaNC17:
    self.mpaa = mpaaValue;
    break;
  default:
    NSAssert(false, @"Invalid MPAA value");
    self.mpaa = MWSMpaaG;
    break;
  }
}

- (void)parseReleaseDate:(NSDictionary *)data
{
  NSNumber * releaseDate = [data objectForKey:@"releaseDate"];
  NSAssert(releaseDate != nil, @"Release date is missing");
  NSAssert([releaseDate isKindOfClass:[NSNumber class]], @"Invalid releaseDate data type");
  if (releaseDate)
    self.releaseDate = [NSDate dateWithTimeIntervalSince1970:[releaseDate doubleValue]];
}

- (void)parseIMDBRating:(NSDictionary *)data
{
  NSNumber * imdbRating = [data objectForKey:@"imdbRating"];
  NSAssert(imdbRating != nil, @"IMDB rating is missing");
  NSAssert([imdbRating isKindOfClass:[NSNumber class]], @"Invalid IMDB rating data type");
  float imdbRatingValue = [imdbRating floatValue];
  if (imdbRatingValue >= 0 && imdbRatingValue <= 10)
  {
    self.imdbRating = imdbRatingValue;
  }
  else
  {
    NSAssert(false, @"Invalid IMDB rating value");
    self.imdbRating = 0;
  }
}

@end
