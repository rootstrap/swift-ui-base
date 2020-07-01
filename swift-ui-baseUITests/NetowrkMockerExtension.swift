//
//  NetowrkMockerExtension.swift
//  swift-ui-baseUITests
//
//  Created by Germán Stábile on 6/30/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import Foundation

extension NetworkMocker {
  
  func stubSignUp(shouldSuceed: Bool = true) {
    let responseFileName = shouldSuceed ?
      "SignUpSuccessfully" : "AuthenticationError"
    
    setupStub(
      url: "/users/",
      responseFilename: responseFileName,
      method: .POST
    )
  }
  
  func stubLogOut() {
    setupStub(
      url: "/users/sign_out",
      responseFilename: "LogOutSuccessfully",
      method: .DELETE
    )
  }
  
  func stubDeleteAccount() {
    setupStub(
      url: "/user/delete_account",
      responseFilename: "LogOutSuccessfully",
      method: .DELETE
    )
  }
  
  func stubLogIn(shouldSuceed: Bool = true) {
    let responseFilename = shouldSuceed ?
      "LoginSuccessfully" : "AuthenticationError"
    
    setupStub(
      url: "/users/sign_in",
      responseFilename: responseFilename,
      method: .POST
    )
  }
  
  func stubGetProfile() {
    setupStub(
      url: "/user/profile",
      responseFilename: "GetProfileSuccessfully",
      method: .GET
    )
  }
}
