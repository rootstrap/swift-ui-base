//
//  StringExtensionUnitTests.swift
//  ios-baseUnitTests
//
//  Created by German on 4/30/20.
//  Copyright © 2020 TopTier labs. All rights reserved.
//

import XCTest
@testable import swift_ui_base

class StringExtensionUnitTests: XCTestCase {
  func testEmailValidation() {
    XCTAssertFalse("username".isEmailFormatted())
    XCTAssertFalse("username@test".isEmailFormatted())
    XCTAssert("username@test.com".isEmailFormatted())
    XCTAssert("username.alias+2@gmail.com".isEmailFormatted())
  }
  
  func testPhoneNumberValidation() {
    XCTAssertFalse("dlfkhgakdfs".isPhoneNumber())
    XCTAssertFalse("1241353".isPhoneNumber())
    XCTAssert("123-123-4314".isPhoneNumber())
    XCTAssert("000-000-0000".isPhoneNumber())
  }
  
  func testAlphanumeric() {
    XCTAssertFalse("123598 sdg asd".isAlphanumericWithNoSpaces)
    XCTAssert("1231234314".isAlphanumericWithNoSpaces)
    XCTAssert("asdgasdg".isAlphanumericWithNoSpaces)
    XCTAssert("asdgasd28352".isAlphanumericWithNoSpaces)
  }
  
  func testHasNumbers() {
    XCTAssertFalse("asdgasdfgkjasf ".hasNumbers)
    XCTAssertFalse("$#^&@".hasNumbers)
    XCTAssert("asd235".hasNumbers)
    XCTAssert("124".hasNumbers)
  }
  
  func testHasPunctuation() {
    XCTAssertFalse("asgfasfdhg123".hasPunctuationCharacters)
    XCTAssert("asdg,asd !".hasPunctuationCharacters)
  }
}
