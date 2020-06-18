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
    field.forceTap()
    field.typeText(text)
  }
  
  func clearText(on fieldName: String) {
    let field = textFields[fieldName]
    field.forceTap()
    field.clearText()
  }
  
  func deleteAccountIfNeeded(in testCase: XCTestCase) {
    let deleteAccountButton = buttons["DeleteAccountButton"]
    let goToLoginButton = buttons["GoToLoginLink"]
    
    if deleteAccountButton.exists {
      deleteAccountButton.forceTap()
      testCase.waitFor(element: goToLoginButton, timeOut: 5)
    }
  }
  
  func attemptSignIn(
    in testCase: XCTestCase,
    with email: String,
    password: String
  ) {
    let goToSignInButton = buttons["GoToLoginLink"]
    
    goToSignInButton.forceTap()
    
    let signInButton = buttons["SignInButton"]
    
    testCase.waitFor(element: signInButton, timeOut: 2)
    
    type(text: email, on: "EmailTextField")
    type(text: password, on: "PasswordTextField", isSecure: true)
    
    //ugly hack to dismiss keyboard
    type(text: "\n", on: "EmailTextField")
    
    signInButton.forceTap()
  }
  
  func attemptSignUp(
    in testCase: XCTestCase,
    with email: String,
    password: String
  ) {
    buttons["GoToSignUpLink"].forceTap()
    
    type(text: email, on: "EmailTextField")
    
    type(
      text: password,
      on: "PasswordTextField",
      isSecure: true
    )
    
    type(
      text: password,
      on: "ConfirmPasswordTextField",
      isSecure: true
    )
    
    //ugly hack to dismiss keyboard
    type(text: "\n", on: "EmailTextField")
    
    buttons["SignUpButton"].forceTap()
  }
}

