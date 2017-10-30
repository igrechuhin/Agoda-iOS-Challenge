//
//  MWSMoviesListDisplayData.h
//  MovieWebService
//
//  Created by Ilya Grechuhin on 30.10.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "MWSMoviesListApi.h"

@interface MWSMoviesListDisplayData : NSObject<MWSMoviesListDisplayDataApi>

@property(copy, nonatomic, readonly) NSString * title;
@property(nonatomic, readonly) UIColor * backgroundColor;

@end
