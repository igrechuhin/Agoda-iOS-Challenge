//
//  MWSTappableLabel.h
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "MWSTappableLabelDelegate.h"

@interface MWSTappableLabel : UILabel

- (instancetype)initWithFrame:(CGRect)frame delegate:(id<MWSTappableLabelDelegate>)delegate;

@end
