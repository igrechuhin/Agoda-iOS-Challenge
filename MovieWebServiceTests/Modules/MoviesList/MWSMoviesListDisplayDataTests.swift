//
//  MWSMoviesListDisplayDataTests.swift
//  MovieWebServiceTests
//
//  Created by Ilya Grechuhin on 02.11.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import XCTest

class MWSMoviesListDisplayDataTests: XCTestCase {
  func testData() {
    let data = MWSMoviesListDisplayData()

    XCTAssertEqual(data.title, "Root View Controller")
    XCTAssertEqual(data.backgroundColor, UIColor.white)
  }
}
