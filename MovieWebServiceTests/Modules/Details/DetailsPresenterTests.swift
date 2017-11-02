//
//  DetailsPresenterTests.swift
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

private class MockView: MWSView, DetailsViewApi {
  var onSetup: (() -> Void)?
  var onDataUpdated: ((DetailsViewModel) -> Void)?

  func setup() {
    onSetup?()
  }

  func dataUpdated(model: DetailsViewModel) {
    onDataUpdated?(model)
  }
}

private class MockInteractor: MWSInteractor, DetailsInteractorApi {
  let movie = MWSMovie(data: [
    "actors": [[
      "dateOfBirth": -436_147_200,
      "nominated": true,
      "name": "Bryan Cranston",
      "screenName": "Jack Donnell",
      "biography": "Bryan Lee Cranston is an American actor, voice actor, writer and director.",
    ]],
    "languages": ["English", "Thai"],
    "name": "Argo",
    "nominated": true,
    "director": [
      "dateOfBirth": 82_684_800,
      "nominated": true,
      "name": "Ben Affleck",
      "biography": "Benjamin Geza Affleck was born on August 15, 1972 in Berkeley, California, USA but raised in Cambridge, Massachusetts, USA.",
    ],
    "mpaa": 3,
    "releaseDate": 1_350_000_000,
    "imdbRating": 7.8,
  ])!
  var onGetMovie: (() -> Void)?

  func getMovie(callback: @escaping FetchMovieCallback) {
    onGetMovie?()
    callback(movie)
  }
}

class DetailsPresenterTests: XCTestCase {
  func testViewHasLoaded() {
    let module = DetailsModule.build(movie: MWSMovie())
    let mockView = MockView()
    let mockInteractor = MockInteractor()

    module.injectMockView(mockView)
    module.injectMockInteractor(mockInteractor)

    let viewSetupExpectation = expectation(description: "Expecting view setup is called")
    mockView.onSetup = {
      viewSetupExpectation.fulfill()
    }

    let viewDataUpdatedExpectation = expectation(description: "Expecting data updated is called")
    mockView.onDataUpdated = { _ in
      viewDataUpdatedExpectation.fulfill()
    }

    let interactorGetmoviesExpectation = expectation(description: "Expecting interactor get movies is called")
    mockInteractor.onGetMovie = {
      interactorGetmoviesExpectation.fulfill()
    }

    module.presenter.viewHasLoaded()

    waitForExpectations(timeout: Config.timeout) { error in
      guard error != nil else { return }
      XCTFail("Presenter expectations are not fullfilled")
    }
  }

  func testViewModelData() {
    let module = DetailsModule.build(movie: MWSMovie())
    let mockView = MockView()
    let mockInteractor = MockInteractor()

    module.injectMockView(mockView)
    module.injectMockInteractor(mockInteractor)

    let viewDataUpdatedExpectation = expectation(description: "Expecting data updated is called")
    mockView.onDataUpdated = { viewModel in
      XCTAssertEqual(viewModel.directorName, mockInteractor.movie.director.name)
      XCTAssertEqual(viewModel.actorName, mockInteractor.movie.actors.first!.name)
      XCTAssertEqual(viewModel.actorScreenName, mockInteractor.movie.actors.first!.screenName)
      viewDataUpdatedExpectation.fulfill()
    }

    module.presenter.viewHasLoaded()

    waitForExpectations(timeout: Config.timeout) { error in
      guard error != nil else { return }
      XCTFail("Presenter expectations are not fullfilled")
    }
  }
}
