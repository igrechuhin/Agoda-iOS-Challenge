//
//  RouterTests.swift
//  MovieWebServiceTests
//
//  Created by Ilya Grechuhin on 02.11.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import XCTest

class RouterTests: XCTestCase {
  private func createModule() -> MWSModule {
    return MWSModule.build(with: MWSView(),
                           interactor: MWSInteractor(),
                           presenter: MWSPresenter(),
                           router: MWSRouter(),
                           displayData: MWSDisplayData())
  }

  func testShowInWindow() {
    let module = createModule()
    let window = UIWindow()

    module.router.show(in: window, embedInNavController: false, makeKeyAndVisible: false)

    XCTAssert(window.rootViewController is MWSView)
  }

  func testShowInWindowEmbeddedInNavigationController() {
    let module = createModule()
    let window = UIWindow()

    module.router.show(in: window, embedInNavController: true, makeKeyAndVisible: true)

    XCTAssert(window.rootViewController is UINavigationController)
    if let navigationController = window.rootViewController as? UINavigationController {
      XCTAssert(navigationController.viewControllers.count == 1)
      XCTAssert(navigationController.viewControllers[0] is MWSView)
    } else {
      XCTAssert(false)
    }
  }

  func testShowFromViewEmbeddedInNavigationController() {
    let module = createModule()
    let view = UIViewController()

    module.router.show(from: view, embedInNavController: true)

    let navigationController = module.view.navigationController
    XCTAssert(navigationController != nil)
    XCTAssert(navigationController?.viewControllers.count == 1)
    XCTAssert(navigationController?.viewControllers[0] is MWSView)
  }
}
