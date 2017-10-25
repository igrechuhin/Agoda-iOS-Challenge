//
//  TappableLabel.h
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "TappableLabelDelegate.h"

@interface TappableLabel : UILabel

@property(weak, nonatomic) id<TappableLabelDelegate> delegate;

@end
