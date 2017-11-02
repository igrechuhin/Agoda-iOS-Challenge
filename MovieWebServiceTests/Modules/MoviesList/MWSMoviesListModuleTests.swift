//
//  MWSMoviesListModuleTests.swift
//  MovieWebServiceTests
//
//  Created by Ilya Grechuhin on 02.11.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import XCTest

class MWSMoviesListModuleTests: XCTestCase {
  func testModuleComponentsType() {
    if let module = MWSMoviesListModule.build(with: MWSDefaultMoviesProvider()) {
      XCTAssert(module.view is MWSMoviesListView)
      XCTAssert(module.interactor is MoviesListInteractor)
      XCTAssert(module.presenter is MoviesListPresenter)
      XCTAssert(module.router is MoviesListRouter)
      XCTAssert(module.displayData is MWSMoviesListDisplayData)
    } else {
      XCTAssert(false)
    }
  }
}
