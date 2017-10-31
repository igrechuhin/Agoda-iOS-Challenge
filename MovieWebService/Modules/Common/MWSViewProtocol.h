//
//  MWSViewProtocol.h
//  MovieWebService
//
//  Created by Ilya Grechuhin on 27.10.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

@class MWSPresenter;
@class MWSDisplayData;

@protocol MWSViewProtocol<NSObject>

@property(nonatomic) MWSPresenter * presenter;
@property(nonatomic) MWSDisplayData * displayData;

@end
