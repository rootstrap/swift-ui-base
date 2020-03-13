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
  
  var router: ViewRouter

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
  
  init(router: ViewRouter) {
    self.router = router
  }
  
  var isValidData: Bool {
    return [emailData, passwordData].allSatisfy { $0.isValid }
  }
  
  func attemptSignin() {
    isLoading = true
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
      self.isLoading = false
      self.router.currentScreen = .home
    })
  }
}
