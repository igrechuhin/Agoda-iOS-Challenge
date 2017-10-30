//
//  MWSViewProtocol.h
//  MovieWebService
//
//  Created by Ilya Grechuhin on 27.10.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

@class MWSPresenter;
@protocol MWSDisplayDataProtocol;

@protocol MWSViewProtocol <NSObject>

@property(nonatomic) MWSPresenter * presenter;
@property(nonatomic) id<MWSDisplayDataProtocol> displayData;

@end
