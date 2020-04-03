//
//  SignUpViewModel.swift
//  swift-ui-base
//
//  Created by Germán Stábile on 4/3/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import Foundation
import UIKit

class SignUpViewModel: ObservableObject, Identifiable {
  @Published var emailData = TextFieldData(
    title: "Email",
    validationType: .email,
    errorMessage: "Please enter a valid email"
  )
  
  @Published var passwordData = TextFieldData(
    title: "Password",
    validationType: .nonEmpty,
    isSecure: true,
    errorMessage: "Passwords don't match"
  )
  
  @Published var confirmPasswordData = TextFieldData(
    title: "Confirm Password",
    validationType: .nonEmpty,
    isSecure: true,
    errorMessage: "Passwords don't match"
  )
  
  @Published var isLoading = false
  @Published var errored = false
  var error: String = ""
  
  init() {
    confirmPasswordData.validationType = .custom(isValid: passwordsMatch)
    passwordData.validationType = .custom(isValid: passwordsMatch)
  }
  
  var isValidData: Bool {
    return [emailData, passwordData].allSatisfy { $0.isValid }
  }
  
  func passwordsMatch() -> Bool {
    guard !passwordData.isEmpty else { return false }
    let areValidPasswords = passwordData.value == confirmPasswordData.value
    passwordData.isValid = areValidPasswords
    confirmPasswordData.isValid = areValidPasswords
    return areValidPasswords
  }
  
  func attemptSingUp() {
    isLoading = true
    LoginServices.signup(
      emailData.value,
      password: passwordData.value,
      avatar64: UIImage.random(),
      success: { [weak self] user in
        self?.isLoading = false
        ViewRouter.shared.currentRoot = .profile
      },
      failure: { [weak self] error in
        self?.isLoading = false
        self?.errored = true
        self?.error = error.localizedDescription
    })
  }
}
