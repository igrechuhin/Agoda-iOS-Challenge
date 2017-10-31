//
//  MWSMoviesListCell.m
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "MWSMoviesListCell.h"
#import "MWSMoviesListItemModel.h"

@interface MWSMoviesListCell ()

@property(weak, nonatomic) IBOutlet UILabel * name;
@property(weak, nonatomic) IBOutlet UILabel * date;
@property(weak, nonatomic) IBOutlet UILabel * mpaaRating;
@property(weak, nonatomic) IBOutlet UILabel * rating;

@end

@implementation MWSMoviesListCell

- (void)configWithModel:(MWSMoviesListItemModel *)model
{
  self.name.text = model.filmName;
  self.date.text = model.releaseDate;
  self.mpaaRating.text = model.mpaaRating;
  self.rating.text = model.rating;
}

@end
