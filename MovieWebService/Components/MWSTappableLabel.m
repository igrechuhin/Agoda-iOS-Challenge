//
//  MWSTappableLabel.m
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "MWSTappableLabel.h"

@interface MWSTappableLabel ()

@property(weak, nonatomic) id<MWSTappableLabelDelegate> delegate;

@end

@implementation MWSTappableLabel

- (instancetype)initWithFrame:(CGRect)frame delegate:(id<MWSTappableLabelDelegate>)delegate
{
  self = [super initWithFrame:frame];
  if (self)
  {
    self.userInteractionEnabled = YES;
    self.delegate = delegate;
  }
  return self;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
  CGPoint const touchPoint = [[touches anyObject] locationInView:self];
  BOOL const selected = (CGRectContainsPoint(self.bounds, touchPoint));
  if (selected)
    [self.delegate didReceiveTouch];
}

@end
