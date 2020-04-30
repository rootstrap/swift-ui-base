//
//  LoginViewModel.swift
//  swift-ui-base
//
//  Created by Germán Stábile on 3/12/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

enum LoginViewModelState {
  case loading
  case idle
  case signedIn
  case error(String)
}

class LoginViewModel: ObservableObject, Identifiable {
  
  @Published var emailData = TextFieldData(
    title: "Email",
    validationType: .email,
    errorMessage: "Please enter a valid email"
  )
  
  @Published var passwordData = TextFieldData(
    title: "Password",
    validationType: .nonEmpty,
    isSecure: true,
    errorMessage: "Please enter a valid password"
  )
  
  @Published var isLoading = false
  @Published var errored = false
  var error: String = ""
  
  var isValidData: Bool {
    return [emailData, passwordData].allSatisfy { $0.isValid }
  }
  
  func attemptSignin() {
    isLoading = true
    
    AuthenticationServices.login(
      emailData.value,
      password: passwordData.value,
      success: { [weak self] in
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
