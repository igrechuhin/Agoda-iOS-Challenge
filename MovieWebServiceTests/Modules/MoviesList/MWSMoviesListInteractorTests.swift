//
//  MWSMoviesListInteractorTests.swift
//  MovieWebServiceTests
//
//  Created by Ilya Grechuhin on 02.11.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import XCTest

private enum Config {
  static let timeout: TimeInterval = 0.5
}

private class MockMoviesProvider: NSObject, MWSMoviesProvider {
  var getMovieExpectation: XCTestExpectation?
  let movie = MWSMovie()

  func getMovieWithID(_: Int, withCallback callback: MWSMovieCallback!) {
    getMovieExpectation?.fulfill()
    callback(movie)
  }
}

class MWSMoviesListInteractorTests: XCTestCase {
  private var mockProvider = MockMoviesProvider()

  func testMovieRequestedFromProvider() {
    let module = MWSMoviesListModule.build(with: mockProvider)!
    mockProvider.getMovieExpectation = expectation(description: "Expecting movie provider is requested for movie")
    let movieProvidedExpectation = expectation(description: "Expecting movies are returned to the caller")

    let moviesListInteractor = module.interactor as! MoviesListInteractor

    moviesListInteractor.getMoviesWithCallback { movies in
      movieProvidedExpectation.fulfill()

      XCTAssert(movies!.count == 1)
      XCTAssert(movies!.first! == self.mockProvider.movie)
    }

    waitForExpectations(timeout: Config.timeout) { error in
      guard error != nil else { return }
      XCTFail("Interactor expectations are not fullfilled")
    }
  }
}
