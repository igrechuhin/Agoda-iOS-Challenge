//
//  PresenterTests.swift
//  MovieWebServiceTests
//
//  Created by Ilya Grechuhin on 02.11.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import XCTest

private enum Config {
  static let timeout: TimeInterval = 0.5
  static let viewHasLoaded = "viewHasLoaded"
  static let viewIsAboutToAppear = "viewIsAboutToAppear"
  static let viewHasAppeared = "viewHasAppeared"
  static let viewIsAboutToDisappear = "viewIsAboutToDisappear"
  static let viewHasDisappeared = "viewHasDisappeared"
}

private class MockPresenter: MWSPresenter {
  var expectation: XCTestExpectation!
  var expectedMethod: String!

  private func assert(method: String) {
    guard method == expectedMethod else { return }
    expectation.fulfill()
  }

  override func viewHasLoaded() {
    super.viewHasLoaded()
    assert(method: Config.viewHasLoaded)
  }

  override func viewIsAboutToAppear() {
    super.viewIsAboutToAppear()
    assert(method: Config.viewIsAboutToAppear)
  }

  override func viewHasAppeared() {
    super.viewHasAppeared()
    assert(method: Config.viewHasAppeared)
  }

  override func viewIsAboutToDisappear() {
    super.viewIsAboutToDisappear()
    assert(method: Config.viewIsAboutToDisappear)
  }

  override func viewHasDisappeared() {
    super.viewHasDisappeared()
    assert(method: Config.viewHasDisappeared)
  }
}

class PresenterTests: XCTestCase {
  private func createModule(testMethod: String) -> MWSModule {
    let presenter = MockPresenter()
    presenter.expectation = expectation(description: "Expecting method: \(testMethod)")
    presenter.expectedMethod = testMethod
    return MWSModule.build(with: MWSView(),
                           interactor: MWSInteractor(),
                           presenter: presenter,
                           router: MWSRouter(),
                           displayData: MWSDisplayData())
  }

  func testViewHasLoaded() {
    let method = Config.viewHasLoaded
    let module = createModule(testMethod: method)

    module.view.viewDidLoad()

    waitForExpectations(timeout: Config.timeout) { error in
      guard error != nil else { return }
      XCTFail("\(method) method is not called")
    }
  }

  func testViewIsAboutToAppear() {
    let method = Config.viewIsAboutToAppear
    let module = createModule(testMethod: method)

    module.view.viewWillAppear(false)

    waitForExpectations(timeout: Config.timeout) { error in
      guard error != nil else { return }
      XCTFail("\(method) method is not called")
    }
  }

  func testViewHasAppeared() {
    let method = Config.viewHasAppeared
    let module = createModule(testMethod: method)

    module.view.viewDidAppear(false)

    waitForExpectations(timeout: Config.timeout) { error in
      guard error != nil else { return }
      XCTFail("\(method) method is not called")
    }
  }

  func testViewIsAboutToDisappear() {
    let method = Config.viewIsAboutToDisappear
    let module = createModule(testMethod: method)

    module.view.viewWillDisappear(false)

    waitForExpectations(timeout: Config.timeout) { error in
      guard error != nil else { return }
      XCTFail("\(method) method is not called")
    }
  }

  func testViewHasDisappeared() {
    let method = Config.viewHasDisappeared
    let module = createModule(testMethod: method)

    module.view.viewDidDisappear(false)

    waitForExpectations(timeout: Config.timeout) { error in
      guard error != nil else { return }
      XCTFail("\(method) method is not called")
    }
  }
}
