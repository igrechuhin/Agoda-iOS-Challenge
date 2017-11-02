//
//  MWSMoviesListViewTests.swift
//  MovieWebServiceTests
//
//  Created by Ilya Grechuhin on 02.11.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import XCTest

private enum Config {
  static let timeout: TimeInterval = 0.5
}

private class MockPresenter: MWSPresenter, MWSMoviesListPresenterApi {
  var moviesCountExpectation: XCTestExpectation?
  var getItemExpectation: XCTestExpectation?
  var itemSelectedExpectation: XCTestExpectation?

  var moviesCount: Int {
    moviesCountExpectation?.fulfill()
    return 1
  }

  func getItemAt(_ index: Int) -> MWSMoviesListItemModel! {
    XCTAssert(index == 0)
    getItemExpectation?.fulfill()
    return MWSMoviesListItemModel(movieName: "Movie name",
                                  releaseDate: "Release date",
                                  mpaaRating: "MPAA rating",
                                  rating: "rating")
  }

  func itemSelected(at index: Int) {
    XCTAssert(index == 0)
    itemSelectedExpectation?.fulfill()
  }
}

private class MockDisplayData: MWSDisplayData, MWSMoviesListDisplayDataApi {
  let title: String! = "Mock Title"
  let backgroundColor: UIColor! = UIColor.blue
}

class MWSMoviesListViewTests: XCTestCase {
  private func createModule() -> MWSModule {
    let module = MWSMoviesListModule.build()!
    let mockPresenter = MockPresenter()
    let mockDisplayData = MockDisplayData()

    module.injectMockPresenter(mockPresenter)
    module.injectMockDisplayData(mockDisplayData)

    return module
  }

  private func createTableView() -> UITableView {
    let tableView = UITableView()
    tableView.register(MWSMoviesListCell.self, forCellReuseIdentifier: "MWSMoviesListCell")
    return tableView
  }

  func testViewSetup() {
    let module = createModule()

    XCTAssert(module.view is MWSMoviesListViewApi)

    let moviesListView = module.view as! MWSMoviesListViewApi
    moviesListView.setup()

    let moviesListDisplayData = module.displayData as! MWSMoviesListDisplayDataApi
    XCTAssert(module.view.navigationItem.title == moviesListDisplayData.title)
    XCTAssert(module.view.view.backgroundColor == moviesListDisplayData.backgroundColor)
  }

  func testPresenterMoviesCountIsRequested() {
    let module = createModule()
    (module.presenter as! MockPresenter).moviesCountExpectation = expectation(description: "Expecting movies count is requested")

    module.view.viewDidLoad()

    let moviesListView = module.view as! MWSMoviesListViewApi
    moviesListView.dataUpdated()
    waitForExpectations(timeout: Config.timeout) { error in
      guard error != nil else { return }
      XCTFail("Presenter movies count is not requested")
    }
  }

  func testPresenterItemIsRequested() {
    let module = createModule()
    (module.presenter as! MockPresenter).getItemExpectation = expectation(description: "Expecting item is requested")

    let dataSource = module.view as! UITableViewDataSource
    dataSource.tableView(createTableView(), cellForRowAt: IndexPath(row: 0, section: 0))

    waitForExpectations(timeout: Config.timeout) { error in
      guard error != nil else { return }
      XCTFail("Presenter item is not requested")
    }
  }

  func testPresenterItemSelectedIsCalled() {
    let module = createModule()
    (module.presenter as! MockPresenter).itemSelectedExpectation = expectation(description: "Expecting item selected is called")

    let delegate = module.view as! UITableViewDelegate
    delegate.tableView!(createTableView(), didSelectRowAt: IndexPath(row: 0, section: 0))

    waitForExpectations(timeout: Config.timeout) { error in
      guard error != nil else { return }
      XCTFail("Presenter item selected is called")
    }
  }
}
