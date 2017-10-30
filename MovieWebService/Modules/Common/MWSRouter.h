//
//  MWSRouter.h
//  MovieWebService
//
//  Created by Ilya Grechuhin on 27.10.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "MWSRouterProtocol.h"

@interface MWSRouter : NSObject<MWSRouterProtocol>

@property(weak, nonatomic) MWSPresenter * presenter;

@end
