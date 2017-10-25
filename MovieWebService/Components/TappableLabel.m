//
//  TappableLabel.m
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "TappableLabel.h"

@implementation TappableLabel

- (instancetype)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self)
    self.userInteractionEnabled = YES;
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
