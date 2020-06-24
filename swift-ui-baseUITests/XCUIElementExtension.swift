//
//  XCUIElementExtension.swift
//  swift-ui-baseUITests
//
//  Created by Germán Stábile on 2/13/20.
//  Copyright © 2020 TopTier labs. All rights reserved.
//

import XCTest

extension XCUIElement {
  
  func clearText(text: String? = nil) {
    guard let stringValue = value as? String ?? text else {
      return
    }
    
    tap()
    let deleteString =
      stringValue.map { _ in XCUIKeyboardKey.delete.rawValue }.joined()
    typeText(deleteString)
  }
}
