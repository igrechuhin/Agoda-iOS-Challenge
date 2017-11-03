//
//  MWSTappableLabelTests.swift
//  MovieWebServiceTests
//
//  Created by Ilya Grechuhin on 03.11.2017.
//  Copyright © 2017 TestCompany. All rights reserved.
//

import XCTest

private enum Config {
  static let timeout: TimeInterval = 0.5
}

private class MockUITouch: UITouch {
  let touchPoint: CGPoint

  init(touchPoint: CGPoint) {
    self.touchPoint = touchPoint
    super.init()
  }

  override func location(in _: UIView?) -> CGPoint {
    return touchPoint
  }
}

class MWSTappableLabelTests: XCTestCase, MWSTappableLabelDelegate {
  var delegateMethodIsCalledExpectation: XCTestExpectation!

  func testDelagateMethodIsCalledForTouchInFrame() {
    let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    let label = MWSTappableLabel(frame: frame, delegate: self)!

    delegateMethodIsCalledExpectation = expectation(description: "Expecting delegate method is called")

    let touches: Set<UITouch> = [MockUITouch(touchPoint: CGPoint(x: frame.width / 2, y: frame.height / 2))]
    label.touchesEnded(touches, with: nil)

    waitForExpectations(timeout: Config.timeout) { error in
      guard error != nil else { return }
      XCTFail("Delegate method is not called")
    }
  }

  func testDelagateMethodIsNotCalledForTouchOutsideFrame() {
    let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    let label = MWSTappableLabel(frame: frame, delegate: self)!

    delegateMethodIsCalledExpectation = expectation(description: "Expecting delegate method is not called")
    delegateMethodIsCalledExpectation.isInverted = true

    let touches: Set<UITouch> = [MockUITouch(touchPoint: CGPoint(x: frame.width + 10, y: frame.height))]
    label.touchesEnded(touches, with: nil)

    waitForExpectations(timeout: Config.timeout) { error in
      guard error != nil else { return }
      XCTFail("Delegate method is not called")
    }
  }

  // MARK: - MWSTappableLabelDelegate
  func didReceiveTouch() {
    delegateMethodIsCalledExpectation.fulfill()
  }
}
