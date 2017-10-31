//
//  MWSMoviesListItemModel.h
//  MovieWebService
//
//  Created by Ilya Grechuhin on 31.10.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

@interface MWSMoviesListItemModel : NSObject

@property(copy, nonatomic, readonly) NSString * movieName;
@property(copy, nonatomic, readonly) NSString * releaseDate;
@property(copy, nonatomic, readonly) NSString * mpaaRating;
@property(copy, nonatomic, readonly) NSString * rating;

- (instancetype)initWithMovieName:(NSString *)movieName
                      releaseDate:(NSString *)releaseDate
                       mpaaRating:(NSString *)mpaaRating
                           rating:(NSString *)rating;

@end
