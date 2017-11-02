//
//  MWSModule+Mock.h
//  MovieWebService
//
//  Created by Ilya Grechuhin on 02.11.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "MWSModule.h"

@interface MWSModule (Mock)

- (void)injectMockView:(MWSView *)view;
- (void)injectMockInteractor:(MWSInteractor *)interactor;
- (void)injectMockPresenter:(MWSPresenter *)presenter;
- (void)injectMockRouter:(MWSRouter *)router;
- (void)injectMockDisplayData:(MWSDisplayData *)displayData;

@end
