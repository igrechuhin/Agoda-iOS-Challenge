//
//  MWSMoviesListPresenterTests.swift
//  MovieWebServiceTests
//
//  Created by Ilya Grechuhin on 02.11.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import XCTest

private enum Config {
  static let timeout: TimeInterval = 0.5
}

private class MockView: MWSView, MWSMoviesListViewApi {
  var onSetup: (() -> Void)?
  var onDataUpdated: (() -> Void)?

  func setup() {
    onSetup?()
  }

  func dataUpdated() {
    onDataUpdated?()
  }
}

private class MockInteractor: MWSInteractor, MWSMoviesListInteractorApi {
  var onGetMovies: (() -> Void)?

  func getMoviesWithCallback(_ callback: MWSFetchMoviesCallback!) {
    onGetMovies?()

    MWSDefaultMoviesProvider().getMovieWithID(0) { movie in
      callback([movie!])
    }
  }
}

private class MockRouter: MWSRouter, MWSMoviesListRouterApi {
  var onShowDetails: (() -> Void)?

  func showDetails(for _: MWSMovie!) {
    onShowDetails?()
  }
}

class MWSMoviesListPresenterTests: XCTestCase {
  func testViewHasLoaded() {
    let module = MWSMoviesListModule.build(with: nil)
    let mockView = MockView()
    let mockInteractor = MockInteractor()

    module!.injectMockView(mockView)
    module!.injectMockInteractor(mockInteractor)

    let viewSetupExpectation = expectation(description: "Expecting view setup is called")
    mockView.onSetup = {
      viewSetupExpectation.fulfill()
    }

    let viewDataUpdatedExpectation = expectation(description: "Expecting data updated is called")
    mockView.onDataUpdated = {
      viewDataUpdatedExpectation.fulfill()
    }

    let interactorGetmoviesExpectation = expectation(description: "Expecting interactor get movies is called")
    mockInteractor.onGetMovies = {
      interactorGetmoviesExpectation.fulfill()
    }

    module?.presenter.viewHasLoaded()

    waitForExpectations(timeout: Config.timeout) { error in
      guard error != nil else { return }
      XCTFail("Presenter expectations are not fullfilled")
    }
  }

  func testMoviesCount() {
    let module = MWSMoviesListModule.build(with: nil)
    let mockView = MockView()
    let mockInteractor = MockInteractor()

    module!.injectMockView(mockView)
    module!.injectMockInteractor(mockInteractor)

    let viewDataUpdatedExpectation = expectation(description: "Expecting data updated is called")
    mockView.onDataUpdated = {
      let moviesListPresenter = module!.presenter as! MWSMoviesListPresenterApi
      XCTAssert(moviesListPresenter.moviesCount == 1)

      viewDataUpdatedExpectation.fulfill()
    }

    module!.presenter.viewHasLoaded()

    waitForExpectations(timeout: Config.timeout) { error in
      guard error != nil else { return }
      XCTFail("Presenter expectations are not fullfilled")
    }
  }

  func testGetItem() {
    let module = MWSMoviesListModule.build(with: nil)
    let mockView = MockView()
    let mockInteractor = MockInteractor()

    module!.injectMockView(mockView)
    module!.injectMockInteractor(mockInteractor)

    let viewDataUpdatedExpectation = expectation(description: "Expecting data updated is called")
    mockView.onDataUpdated = {
      let moviesListPresenter = module!.presenter as! MWSMoviesListPresenterApi
      let item = moviesListPresenter.getItemAt(0)

      XCTAssert(item?.movieName == "Argo")
      XCTAssert(item?.releaseDate == "Oct 12, 2012")
      XCTAssert(item?.mpaaRating == "R")
      XCTAssert(item?.rating == "7.8")
      viewDataUpdatedExpectation.fulfill()
    }

    module!.presenter.viewHasLoaded()

    waitForExpectations(timeout: Config.timeout) { error in
      guard error != nil else { return }
      XCTFail("Presenter expectations are not fullfilled")
    }
  }

  func testItemSelected() {
    let module = MWSMoviesListModule.build(with: nil)
    let mockView = MockView()
    let mockInteractor = MockInteractor()
    let mockRouter = MockRouter()

    module!.injectMockView(mockView)
    module!.injectMockInteractor(mockInteractor)
    module!.injectMockRouter(mockRouter)

    let routerShowDetailsIsCalled = expectation(description: "Expecting router show details is called")
    mockRouter.onShowDetails = {
      routerShowDetailsIsCalled.fulfill()
    }

    mockView.onDataUpdated = {
      let moviesListPresenter = module!.presenter as! MWSMoviesListPresenterApi
      moviesListPresenter.itemSelected(at: 0)
    }

    module!.presenter.viewHasLoaded()

    waitForExpectations(timeout: Config.timeout) { error in
      guard error != nil else { return }
      XCTFail("Presenter expectations are not fullfilled")
    }
  }
}
