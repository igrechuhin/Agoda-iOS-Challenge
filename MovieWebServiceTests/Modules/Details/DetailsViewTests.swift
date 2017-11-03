//
//  DetailsViewTests.swift
//  MovieWebServiceTests
//
//  Created by Ilya Grechuhin on 03.11.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

@testable import MovieWebService

import XCTest

private class MockDisplayData: MWSDisplayData, DetailsDisplayDataApi {
  let backgroundColor = UIColor.white
  let directorNameTitle = "Director Name"
  let actorNameTitle = "Actor Name"
  let actorScreenNameTitle = "Actor Screen Name"
  let showMoreActionTitle = "Tap here to show more"
  let showLessActionTitle = "Tap here to show less"
}

class DetailsViewTests: XCTestCase {
  private func createModule() -> MWSModule {
    let module = DetailsModule.build(movie: MWSMovie())
    let mockDisplayData = MockDisplayData()

    module.injectMockDisplayData(mockDisplayData)

    return module
  }

  func testViewSetup() {
    let module = createModule()

    XCTAssert(module.view is DetailsViewApi)

    let detailsView = module.view as! DetailsViewApi
    detailsView.setup()

    let displayData = module.displayData as! DetailsDisplayDataApi

    XCTAssertEqual(module.view.view.backgroundColor, displayData.backgroundColor)
  }
}
