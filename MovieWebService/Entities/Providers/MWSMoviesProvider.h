//
//  MWSMoviesProvider.h
//  MovieWebService
//
//  Created by Ilya Grechuhin on 27.10.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

@class MWSMovie;

typedef void (^MWSMovieCallback)(MWSMovie *);

@protocol MWSMoviesProvider<NSObject>

- (void)getMovieWithID:(NSInteger)movieID withCallback:(MWSMovieCallback)callback;

@end
