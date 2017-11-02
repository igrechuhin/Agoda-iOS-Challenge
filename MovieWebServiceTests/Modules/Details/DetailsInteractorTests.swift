//
//  DetailsInteractorTests.swift
//  MovieWebServiceTests
//
//  Created by Ilya Grechuhin on 02.11.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

@testable import MovieWebService

import XCTest

private enum Config {
  static let timeout: TimeInterval = 0.5
}

class DetailsInteractorTests: XCTestCase {
  func testMovieRequest() {
    let testMovie = MWSMovie()
    let module = DetailsModule.build(movie: testMovie)

    let movieProvidedExpectation = expectation(description: "Expecting movie is returned to the caller")

    let detailsInteractor = module.interactor as! DetailsInteractorApi

    detailsInteractor.getMovie { movie in
      XCTAssertEqual(testMovie, movie)

      movieProvidedExpectation.fulfill()
    }

    waitForExpectations(timeout: Config.timeout) { error in
      guard error != nil else { return }
      XCTFail("Interactor expectations are not fullfilled")
    }
  }
}
