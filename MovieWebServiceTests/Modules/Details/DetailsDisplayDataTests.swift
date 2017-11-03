//
//  DetailsDisplayDataTests.swift
//  MovieWebServiceTests
//
//  Created by Ilya Grechuhin on 02.11.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

@testable import MovieWebService

import XCTest

class DetailsDisplayDataTests: XCTestCase {
  func testData() {
    let data = DetailsDisplayData()

    XCTAssertEqual(data.backgroundColor, UIColor.white)
    XCTAssertEqual(data.title, "Details")
    XCTAssertEqual(data.directorNameTitle, "Director Name")
    XCTAssertEqual(data.actorNameTitle, "Actor Name")
    XCTAssertEqual(data.actorScreenNameTitle, "Actor Screen Name")
    XCTAssertEqual(data.showMoreActionTitle, "Tap here to show more")
    XCTAssertEqual(data.showLessActionTitle, "Tap here to show less")
  }
}
