//
//  swift-ui-baseUITests
//
//  Created by Germán Stábile on 2/13/20.
//  Copyright © 2020 TopTier labs. All rights reserved.
//

import XCTest
@testable import swift_ui_base

class ios_baseUITests: XCTestCase {
  
  var app: XCUIApplication!
  
  override func setUp() {
    super.setUp()
    app = XCUIApplication()
    app.launchArguments = ["Automation Test"]
  }
  
  func testCreateAccountValidations() {
    app.launch()
    
    app.deleteAccountIfNeeded(in: self)
    
    app.buttons["GoToSignUpLink"].tap()
    
    let signUpButton = app.buttons["SignUpButton"]
    waitFor(element: signUpButton, timeOut: 2)
    
    XCTAssertFalse(signUpButton.isEnabled)
    
    app.type(text: "automation@test", on: "EmailTextField")
    
    app.type(
      text: "holahola",
      on: "PasswordTextField",
      isSecure: true
    )
    XCTAssertFalse(signUpButton.isEnabled)
    
    app.type(
      text: "holahola",
      on: "ConfirmPasswordTextField",
      isSecure: true
    )
    XCTAssertFalse(signUpButton.isEnabled)
    
    app.type(text: ".com", on: "EmailTextField")
    XCTAssert(signUpButton.isEnabled)
    
    app.type(
      text: "holahol",
      on: "ConfirmPasswordTextField",
      isSecure: true
    )
    XCTAssertFalse(signUpButton.isEnabled)
  }
  
  func testAccountCreation() {
    app.launch()
    
    app.deleteAccountIfNeeded(in: self)
    
    //sleep so the server gets time to delete the account
    sleep(5)
    app.attemptSignUp(
      in: self,
      with: "automation@test.com",
      password: "holahola"
    )
    
    let logOutButton = app.buttons["LogOutButton"]
    
    waitFor(element: logOutButton, timeOut: 15)
    
    logOutButton.tap()
    
    app.attemptSignIn(
      in: self,
      with: "automation@test.com",
      password: "holahola"
    )
    
    let getMyProfile = app.buttons["GetMyProfileButton"]
    waitFor(element: getMyProfile, timeOut: 10)
    getMyProfile.tap()
    
    sleep(10)
    if let alert = app.alerts.allElementsBoundByIndex.first {
      waitFor(element: alert, timeOut: 10)
      
      alert.buttons.allElementsBoundByIndex.first?.tap()
      
      app.deleteAccountIfNeeded(in: self)
    }
  }
  
  func testSignInFailure() {
    app.launch()
    
    app.deleteAccountIfNeeded(in: self)
    
    app.attemptSignIn(
      in: self,
      with: "automation@test.com",
      password: "incorrect password"
    )
    
    if let alert = app.alerts.allElementsBoundByIndex.first {
      waitFor(element: alert, timeOut: 2)
      XCTAssertTrue(alert.label == "Error")
      
      alert.buttons.allElementsBoundByIndex.first?.tap()
    }
    
    let signInButton = app.buttons["SignInButton"]
    waitFor(element: signInButton, timeOut: 2)
  }
  
  func testSignInValidations() {
    app.launch()
    
    app.deleteAccountIfNeeded(in: self)
    
    app.buttons["GoToLoginLink"].tap()
    
    let signInButton = app.buttons["SignInButton"]
    
    waitFor(element: signInButton, timeOut: 2)
    
    XCTAssertFalse(signInButton.isEnabled)
    
    app.type(text: "automation@test", on: "EmailTextField")
    app.type(
      text: "holahola",
      on: "PasswordTextField",
      isSecure: true
    )
    
    XCTAssertFalse(signInButton.isEnabled)
    
    app.type(text: ".com", on: "EmailTextField")
    
    XCTAssert(signInButton.isEnabled)
  }
}
