//
//  MWSMoviesListApi.h
//  MovieWebService
//
//  Created by Ilya Grechuhin on 30.10.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "MWSDisplayDataProtocol.h"
#import "MWSFilm.h"
#import "MWSInteractorProtocol.h"
#import "MWSPresenterProtocol.h"
#import "MWSRouterProtocol.h"
#import "MWSViewProtocol.h"

typedef void (^MWSFetchMoviesCallback)(NSArray<MWSFilm *> *);

@protocol MWSMoviesListViewApi<MWSViewProtocol>

- (void)setup;
- (void)dataUpdated;

@end

@protocol MWSMoviesListInteractorApi<MWSInteractorProtocol>

- (void)getMoviesWithCallback:(MWSFetchMoviesCallback)callback;

@end

@protocol MWSMoviesListPresenterApi<MWSPresenterProtocol>

@property(nonatomic, readonly) NSInteger moviesCount;

- (MWSFilm *)getMovieAtIndex:(NSInteger)index;

@end

@protocol MWSMoviesListRouterApi<MWSRouterProtocol>

@end

@protocol MWSMoviesListDisplayDataApi<MWSDisplayDataProtocol>

@property(copy, nonatomic, readonly) NSString * title;
@property(nonatomic, readonly) UIColor * backgroundColor;

@end
