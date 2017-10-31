//
//  MWSGenericRole.h
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

@class MWSMovie;

@interface MWSGenericRole : NSObject

@property(copy, nonatomic, readonly) NSString * biography;
@property(copy, nonatomic, readonly) NSString * name;
@property(nonatomic, readonly) BOOL nominated;
@property(nonatomic, readonly) NSDate * dateOfBirth;
@property(weak, nonatomic, readonly) MWSMovie * movie;

- (instancetype)initWithData:(NSDictionary *)data movie:(MWSMovie *)movie;

@end
