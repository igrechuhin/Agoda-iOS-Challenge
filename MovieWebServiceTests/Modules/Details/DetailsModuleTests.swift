//
//  DetailsModuleTests.swift
//  MovieWebServiceTests
//
//  Created by Ilya Grechuhin on 02.11.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

@testable import MovieWebService

import XCTest

class DetailsModuleTests: XCTestCase {
  func testModuleComponentsType() {
    let module = DetailsModule.build(movie: MWSMovie())
    XCTAssert(module.view is DetailsView)
    XCTAssert(module.interactor is DetailsInteractor)
    XCTAssert(module.presenter is DetailsPresenter)
    XCTAssert(module.router is DetailsRouter)
    XCTAssert(module.displayData is DetailsDisplayData)
  }
}
