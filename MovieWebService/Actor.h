//
//  Actor.h
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "MWSGenericRole.h"

@interface Actor : MWSGenericRole

@property(nonatomic, strong) NSString * screenName;

- (instancetype)initWithData:(NSDictionary *)data film:(MWSFilm *)film;

@end
