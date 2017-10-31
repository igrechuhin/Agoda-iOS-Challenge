//
//  MWSMoviesListView.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MWSMoviesListView.h"
#import "AppDelegate.h"
#import "MWSMoviesListCell.h"
#import "MWSPresenter.h"
#import "Masonry.h"
#import "MovieWebService-Swift.h"

@interface MWSMoviesListView ()<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic) UITableView * tableView;

@end

@implementation MWSMoviesListView

#pragma mark - Life cycle

- (void)viewDidLoad
{
  [super viewDidLoad];

  [self createTableView];
  [self registerCells];
  [self addTableViewToView];
}

#pragma mark - Helpers

- (void)createTableView
{
  UITableView * tableView =
      [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
  tableView.dataSource = self;
  tableView.delegate = self;
  self.tableView = tableView;
}

- (void)registerCells
{
  UITableView * tableView = self.tableView;
  [tableView registerWithCellClass:[MWSMoviesListCell class]];
}

- (void)addTableViewToView
{
  UIView * view = self.view;
  UITableView * tableView = self.tableView;
  [view addSubview:tableView];

  [tableView mas_remakeConstraints:^(MASConstraintMaker * make) {
    make.left.mas_equalTo(view);
    make.right.mas_equalTo(view);
    make.top.mas_equalTo(view);
    make.bottom.mas_equalTo(view);
  }];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
  MWSPresenter<MWSMoviesListPresenterApi> * presenter = self.moviesListPresenter;
  MWSFilm * film = [presenter getMovieAtIndex:indexPath.row];
  MWSModule * details = [DetailsModule buildWithMovie:film];
  [details.router showFrom:self embedInNavController:NO];
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  MWSPresenter<MWSMoviesListPresenterApi> * presenter = self.moviesListPresenter;
  MWSFilm * film = [presenter getMovieAtIndex:indexPath.row];
  MWSMoviesListCell * cell =
      (MWSMoviesListCell *)[tableView dequeueReusableCellWithCellClass:[MWSMoviesListCell class]
                                                             indexPath:indexPath];

  cell.name.text = film.name;

  NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
  dateFormatter.dateStyle = NSDateFormatterMediumStyle;
  dateFormatter.timeStyle = NSDateFormatterNoStyle;
  cell.date.text = [dateFormatter stringFromDate:film.releaseDate];

  NSString * filmRatingText;
  switch (film.mpaa)
  {
  case MWSMpaaG: filmRatingText = @"G"; break;
  case MWSMpaaPG: filmRatingText = @"PG"; break;
  case MWSMpaaPG13: filmRatingText = @"PG13"; break;
  case MWSMpaaR: filmRatingText = @"R"; break;
  case MWSMpaaNC17: filmRatingText = @"NC17"; break;
  default: break;
  }
  cell.filmRating.text = filmRatingText;
  cell.rating.text = [[NSNumber numberWithFloat:film.imdbRating] stringValue];

  return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  MWSPresenter<MWSMoviesListPresenterApi> * presenter = self.moviesListPresenter;
  return presenter.moviesCount;
}

#pragma mark - MWSMoviesListViewApi

- (void)setup
{
  id<MWSMoviesListDisplayDataApi> displayData = self.moviesListDisplayData;
  self.navigationItem.title = displayData.title;
  self.view.backgroundColor = displayData.backgroundColor;
}

- (void)dataUpdated
{
  UITableView * tableView = self.tableView;
  NSAssert(tableView != nil, @"Data updated before view is ready to process it");
  [tableView reloadData];
}

#pragma mark - Properties

- (MWSPresenter<MWSMoviesListPresenterApi> *)moviesListPresenter
{
  MWSPresenter * presenter = super.presenter;
  NSAssert([presenter conformsToProtocol:@protocol(MWSMoviesListPresenterApi)],
           @"Invalid presenter type");
  return (MWSPresenter<MWSMoviesListPresenterApi> *)(presenter);
}

- (id<MWSMoviesListDisplayDataApi>)moviesListDisplayData
{
  id<MWSDisplayDataProtocol> displayData = super.displayData;
  NSAssert([displayData conformsToProtocol:@protocol(MWSMoviesListDisplayDataApi)],
           @"Invalid display data type");
  return (id<MWSMoviesListDisplayDataApi>)(displayData);
}

@end
