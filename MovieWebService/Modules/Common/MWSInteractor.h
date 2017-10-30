//
//  MWSInteractor.h
//  MovieWebService
//
//  Created by Ilya Grechuhin on 27.10.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "MWSInteractorProtocol.h"

@interface MWSInteractor : NSObject <MWSInteractorProtocol>

@property(weak, nonatomic) MWSPresenter * presenter;

@end
