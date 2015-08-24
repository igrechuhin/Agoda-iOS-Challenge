//
//  Film.h
//  MovieWebService
//
//  Created by Tan, Michael (Agoda) on 3/10/14.
//  Copyright (c) 2014 Tan, Michael (Agoda). All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Actor.h"
#import "Director.h"

typedef enum {
    G = 0,
    PG,
    PG13,
    R,
    NC17
} FilmRating;

NS_ASSUME_NONNULL_BEGIN

@interface Film : NSObject {
    BOOL *nominated;
}

@property (nonatomic) FilmRating filmRating;
@property (weak, nonatomic) NSArray *languages;
@property (weak, nonatomic) NSDate *releaseDate;
@property (weak, nonatomic) NSArray<Actor*> *cast;

- (id)initWithData:(NSDictionary *)data;

@property (nonatomic, strong) NSString *name;
@property (nonatomic) double rating;
@property (nonatomic, strong) Director *director;

@end

NS_ASSUME_NONNULL_END