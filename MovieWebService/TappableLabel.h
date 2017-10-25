//
//  TappableLabel.h
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

@protocol TappableLabelDelegate;

@interface TappableLabel : UILabel

@property(nonatomic, strong) id<TappableLabelDelegate> delegate;

@end

@protocol TappableLabelDelegate<NSObject>

@optional

- (void)didReceiveTouch;

@end
