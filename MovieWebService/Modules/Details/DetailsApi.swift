//
//  DetailsApi.swift
//  MovieWebService
//
//  Created by Ilya Grechuhin on 30.10.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

protocol DetailsViewApi: MWSViewProtocol {
}

protocol DetailsInteractorApi: MWSInteractorProtocol {
}

protocol DetailsPresenterApi: MWSPresenterProtocol {
}

protocol DetailsRouterApi: MWSRouterProtocol {
}

protocol DetailsDisplayDataApi: MWSDisplayDataProtocol {
  var backgroundColor: UIColor { get }
  var directorNameTitle: String { get }
  var showMoreActionTitle: String { get }
  var showLessActionTitle: String { get }
}
