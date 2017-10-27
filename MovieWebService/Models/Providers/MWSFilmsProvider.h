//
//  MWSFilmsProvider.h
//  MovieWebService
//
//  Created by Ilya Grechuhin on 27.10.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

@class MWSFilm;

typedef void (^MWSFilmCallback)(MWSFilm *);

@protocol MWSFilmsProvider <NSObject>

+ (void)getFilm:(NSInteger)filmID withCallback:(MWSFilmCallback)callback;

@end
