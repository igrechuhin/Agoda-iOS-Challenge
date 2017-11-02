//
//  ModuleTests.swift
//  MovieWebServiceTests
//
//  Created by Ilya Grechuhin on 02.11.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import XCTest

private class MockView: MWSView {}
private class MockPresenter: MWSPresenter {}
private class MockInteractor: MWSInteractor {}
private class MockRouter: MWSRouter {}
private class MockDisplayData: MWSDisplayData {}

class ModuleTests: XCTestCase {
  private func createModule() -> MWSModule {
    return MWSModule.build(with: MockView(),
                           interactor: MockInteractor(),
                           presenter: MockPresenter(),
                           router: MockRouter(),
                           displayData: MockDisplayData())
  }

  func testModuleComponentsType() {
    let module = createModule()

    XCTAssert(module.view is MockView)
    XCTAssert(module.interactor is MockInteractor)
    XCTAssert(module.presenter is MockPresenter)
    XCTAssert(module.router is MockRouter)
    XCTAssert(module.displayData is MockDisplayData)
  }

  func testModuleDependencies() {
    let module = createModule()

    XCTAssert(module.view.presenter is MockPresenter)
    XCTAssert(module.view.displayData is MockDisplayData)
    XCTAssert(module.interactor.presenter is MockPresenter)
    XCTAssert(module.presenter.view is MockView)
    XCTAssert(module.presenter.interactor is MockInteractor)
    XCTAssert(module.presenter.router is MockRouter)
    XCTAssert(module.router.presenter is MockPresenter)
  }

  func testMockViewInjection() {
    let module = createModule()
    let mockView = MockView()

    module.injectMockView(mockView)

    XCTAssert(module.view == mockView)
    XCTAssert(module.view.presenter == module.presenter)
    XCTAssert(module.view.displayData == module.displayData)
    XCTAssert(module.presenter.view == mockView)
  }

  func testMockInteractorInjection() {
    let module = createModule()
    let mockInteractor = MockInteractor()

    module.injectMockInteractor(mockInteractor)

    XCTAssert(module.interactor == mockInteractor)
    XCTAssert(module.interactor.presenter == module.presenter)
    XCTAssert(module.presenter.interactor == mockInteractor)
  }

  func testMockPresenterInjection() {
    let module = createModule()
    let mockPresenter = MockPresenter()

    module.injectMockPresenter(mockPresenter)

    XCTAssert(module.presenter == mockPresenter)
    XCTAssert(module.presenter.view == module.view)
    XCTAssert(module.presenter.interactor == module.interactor)
    XCTAssert(module.presenter.router == module.router)
    XCTAssert(module.view.presenter == mockPresenter)
    XCTAssert(module.interactor.presenter == mockPresenter)
    XCTAssert(module.router.presenter == mockPresenter)
  }

  func testMockRouterInjection() {
    let module = createModule()
    let mockRouter = MockRouter()

    module.injectMockRouter(mockRouter)

    XCTAssert(module.router == mockRouter)
    XCTAssert(module.router.presenter == module.presenter)
    XCTAssert(module.presenter.router == mockRouter)
  }
}
