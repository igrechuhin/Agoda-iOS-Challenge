//
//  MoviesListViewController.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MWSMoviesListView.h"
#import "MWSDefaultFilmsProvider.h"
#import "MWSFilm.h"
#import "Masonry.h"
#import "MWSMoviesListDisplayData.h"
#import "MovieWebService-Swift.h"
#import "CellTableViewCell.h"
#import "MWSPresenter.h"
#import "AppDelegate.h"

@interface MoviesListViewController()<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic) UITableView * tableView;

@end

@implementation MoviesListViewController

#pragma mark - Life cycle

- (void)viewDidLoad
{
  [super viewDidLoad];
//  [MWSDefaultFilmsProvider getFilm:0 withCallback:^(MWSFilm * film) {
//    [self.output setData:film];
//  }];
//
//  [self.output didTriggerViewReadyEvent];
//  [self.output setViewForSetup:self.view];

  [self createTableView];
  [self registerCells];
  [self addTableViewToView];
}

#pragma mark - Helpers

- (void)createTableView
{
  UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
  tableView.dataSource = self;
  tableView.delegate = self;
  self.tableView = tableView;
}

- (void)registerCells
{
  UITableView * tableView = self.tableView;
  [tableView registerWithCellClass:[CellTableViewCell class]];
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
  AppDelegate * appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
  MWSPresenter<MWSMoviesListPresenterApi> * presenter = self.moviesListPresenter;
  MWSFilm * film = [presenter getMovieAtIndex:indexPath.row];
  DetailsModuleBuilder * builder = [DetailsModuleBuilder new];
  [appDelegate.rootNavigationController pushViewController:[builder buildWith:film] animated:YES];
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  MWSPresenter<MWSMoviesListPresenterApi> * presenter = self.moviesListPresenter;
  MWSFilm * film = [presenter getMovieAtIndex:indexPath.row];
  CellTableViewCell * cell = (CellTableViewCell *)[tableView dequeueReusableCellWithCellClass:[CellTableViewCell class] indexPath:indexPath];

  cell.name.text = film.name;

  NSCalendar * cal = [NSCalendar new];
  NSString * dateText;
  NSDateFormatter * f = [[NSDateFormatter alloc] init];
  [f setCalendar:cal];
  dateText = [f stringFromDate:film.releaseDate];

  cell.date.text = dateText;

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
  NSAssert([presenter conformsToProtocol:@protocol(MWSMoviesListPresenterApi)], @"Invalid presenter type");
  return (MWSPresenter<MWSMoviesListPresenterApi> *)(presenter);
}

- (id<MWSMoviesListDisplayDataApi>)moviesListDisplayData
{
  id<MWSDisplayDataProtocol> displayData = super.displayData;
  NSAssert([displayData conformsToProtocol:@protocol(MWSMoviesListDisplayDataApi)], @"Invalid display data type");
  return (id<MWSMoviesListDisplayDataApi>)(displayData);
}

@end
