//
//  MWSInteractorProtocol.h
//  MovieWebService
//
//  Created by Ilya Grechuhin on 27.10.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

@class MWSPresenter;

@protocol MWSInteractorProtocol <NSObject>

@property(weak, nonatomic) MWSPresenter * presenter;

@end

