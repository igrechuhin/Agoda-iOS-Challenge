//
//  DetailsApi.swift
//  MovieWebService
//
//  Created by Ilya Grechuhin on 30.10.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

struct DetailsViewModel {
  let directorName: String
  let actorName: String
  let actorScreenName: String
}

typealias FetchMovieCallback = ((MWSMovie) -> Void)

protocol DetailsViewApi: MWSViewProtocol {
  func setup()
  func dataUpdated(model: DetailsViewModel)
}

protocol DetailsInteractorApi: MWSInteractorProtocol {
  func getMovie(callback: @escaping FetchMovieCallback)
}

protocol DetailsPresenterApi: MWSPresenterProtocol {
}

protocol DetailsRouterApi: MWSRouterProtocol {
}

protocol DetailsDisplayDataApi: MWSDisplayDataProtocol {
  var backgroundColor: UIColor { get }
  var title: String { get }
  var directorNameTitle: String { get }
  var actorNameTitle: String { get }
  var actorScreenNameTitle: String { get }
  var showMoreActionTitle: String { get }
  var showLessActionTitle: String { get }
}
