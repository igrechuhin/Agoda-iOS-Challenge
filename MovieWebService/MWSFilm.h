//
//  MWSFilm.h
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "MWSMpaa.h"

@class MWSDirector;
@class MWSActor;

@interface MWSFilm : NSObject

@property(copy, nonatomic, readonly) NSArray<MWSActor *> * actors;
@property(copy, nonatomic, readonly) NSArray<NSString *> * languages;
@property(copy, nonatomic, readonly) NSString * name;
@property(nonatomic, readonly) BOOL nominated;
@property(nonatomic, readonly) MWSDirector * director;
@property(nonatomic, readonly) MWSMpaa mpaa;
@property(nonatomic, readonly) NSDate * releaseDate;
@property(nonatomic, readonly) float imdbRating;

- (instancetype)initWithData:(NSDictionary *)data;

@end
