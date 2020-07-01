//
//  XCUIApplicationExtension.swift
//  swift-ui-baseUITests
//
//  Created by Germán Stábile on 2/13/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import XCTest

extension XCUIApplication {
  func type(text: String, on fieldName: String, isSecure: Bool = false) {
    let fields = isSecure ? secureTextFields : textFields
    let field = fields[fieldName]
    field.tap()
    field.typeText(text)
  }
  
  func dismissKeyboard() {
    //ugly hack to dismiss keyboard
    let field = textFields.firstMatch
    field.tap()
    field.typeText("\n")
  }
  
  func clearText(on fieldName: String) {
    let field = textFields[fieldName]
    field.tap()
    field.clearText()
  }
  
  func deleteAccountIfNeeded(in testCase: XCTestCase) {
    let deleteAccountButton = buttons["DeleteAccountButton"]
    let goToLoginButton = buttons["GoToLoginLink"]
    
    if deleteAccountButton.exists {
      deleteAccountButton.tap()
      testCase.waitFor(element: goToLoginButton, timeOut: 5)
    }
  }
  
  func attemptSignIn(
    in testCase: XCTestCase,
    with email: String,
    password: String
  ) {
    let goToSignInButton = buttons["GoToLoginLink"]
    
    goToSignInButton.tap()
    
    let signInButton = buttons["SignInButton"]
    
    testCase.waitFor(element: signInButton, timeOut: 2)
    
    type(text: email, on: "EmailTextField")
    type(text: password, on: "PasswordTextField", isSecure: true)
    
    dismissKeyboard()
    
    signInButton.tap()
  }
  
  func attemptSignUp(
    in testCase: XCTestCase,
    with email: String,
    password: String
  ) {
    buttons["GoToSignUpLink"].tap()
    
    type(text: email, on: "EmailTextField")
    
    type(
      text: password,
      on: "PasswordTextField",
      isSecure: true
    )
    
    dismissKeyboard()
    
    type(
      text: password,
      on: "ConfirmPasswordTextField",
      isSecure: true
    )
    
    dismissKeyboard()
    
    buttons["SignUpButton"].tap()
  }
}
