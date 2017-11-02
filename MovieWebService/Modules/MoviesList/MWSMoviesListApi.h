//
//  MWSMoviesListApi.h
//  MovieWebService
//
//  Created by Ilya Grechuhin on 30.10.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "MWSDisplayDataProtocol.h"
#import "MWSInteractorProtocol.h"
#import "MWSPresenterProtocol.h"
#import "MWSRouterProtocol.h"
#import "MWSViewProtocol.h"

@class MWSMovie;
@class MWSMoviesListItemModel;

typedef void (^MWSFetchMoviesCallback)(NSArray<MWSMovie *> *);

@protocol MWSMoviesListViewApi<MWSViewProtocol>

- (void)setup;
- (void)dataUpdated;

@end

@protocol MWSMoviesListInteractorApi<MWSInteractorProtocol>

- (void)getMoviesWithCallback:(MWSFetchMoviesCallback)callback;

@end

@protocol MWSMoviesListPresenterApi<MWSPresenterProtocol>

@property(nonatomic, readonly) NSInteger moviesCount;

- (MWSMoviesListItemModel *)getItemAtIndex:(NSInteger)index;
- (void)itemSelectedAtIndex:(NSInteger)index;

@end

@protocol MWSMoviesListRouterApi<MWSRouterProtocol>

- (void)showDetailsForMovie:(MWSMovie *)movie;

@end

@protocol MWSMoviesListDisplayDataApi<MWSDisplayDataProtocol>

@property(copy, nonatomic, readonly) NSString * title;
@property(nonatomic, readonly) UIColor * backgroundColor;

@end
