//
//  MovieWebServiceUITests.swift
//  MovieWebServiceUITests
//
//  Created by Ilya Grechuhin on 03.11.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import XCTest

class MovieWebServiceUITests: XCTestCase {
  override func setUp() {
    super.setUp()
    continueAfterFailure = false
    XCUIApplication().launch()
  }

  func testFirstScreen() {
    let app = XCUIApplication()

    XCTAssertEqual(app.navigationBars.element(boundBy: 0).identifier, "Root View Controller")
  }

  func testMoviesListFirstCellContent() {
    let app = XCUIApplication()

    let table = app.tables.element(boundBy: 0)
    let firstTableCell = table.cells.element(boundBy: 0)

    XCTAssertEqual(firstTableCell.staticTexts["Name"].label, "Argo")
    XCTAssertEqual(firstTableCell.staticTexts["Date"].label, "Oct 12, 2012")
    XCTAssertEqual(firstTableCell.staticTexts["Mpaa"].label, "R")
    XCTAssertEqual(firstTableCell.staticTexts["Rating"].label, "7.8")
  }

  func testDetailsScreen() {
    let app = XCUIApplication()

    let table = app.tables.element(boundBy: 0)
    let firstTableCell = table.cells.element(boundBy: 0)

    firstTableCell.tap()

    XCTAssertEqual(app.navigationBars.element(boundBy: 0).identifier, "Details")
  }

  func testDetailsScreenContent() {
    let app = XCUIApplication()

    let table = app.tables.element(boundBy: 0)
    let firstTableCell = table.cells.element(boundBy: 0)

    firstTableCell.tap()

    XCTAssertEqual(app.staticTexts["directorTitle"].label, "Director Name")
    XCTAssertEqual(app.staticTexts["directorName"].label, "Ben Affleck")
    XCTAssertEqual(app.staticTexts["tapToShowMore"].label, "Tap here to show more")
  }

  func testDetailsScreenMoreContent() {
    let app = XCUIApplication()

    let table = app.tables.element(boundBy: 0)
    let firstTableCell = table.cells.element(boundBy: 0)

    firstTableCell.tap()

    app.staticTexts["tapToShowMore"].tap()

    XCTAssertEqual(app.staticTexts["directorTitle"].label, "Director Name")
    XCTAssertEqual(app.staticTexts["directorName"].label, "Ben Affleck")
    XCTAssertEqual(app.staticTexts["tapToShowMore"].label, "Tap here to show less")

    XCTAssertEqual(app.staticTexts["actorNameTitle"].label, "Actor Name")
    XCTAssertEqual(app.staticTexts["actorName"].label, "Bryan Cranston")
    XCTAssertEqual(app.staticTexts["actorScreenNameTitle"].label, "Actor Screen Name")
    XCTAssertEqual(app.staticTexts["actorScreenName"].label, "Jack Donnell")
  }
}
