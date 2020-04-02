//
//  BaseService.swift
//  swift-ui-base
//
//  Created by Germán Stábile on 4/1/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import Foundation

class LoginServices {
  
  fileprivate static let usersUrl = "/users/"
  fileprivate static let currentUserUrl = "/user/"
  
  class func login(_ email: String,
                   password: String,
                   success: @escaping () -> Void,
                   failure: @escaping (_ error: Error) -> Void) {
    let url = usersUrl + "sign_in"
    let parameters = [
      "user": [
        "email": email,
        "password": password
      ]
    ]
    APIClient.request(.post, url: url, params: parameters, success: { response, headers in
      LoginServices.saveUserSession(fromResponse: response, headers: headers)
      success()
    }, failure: { error in
      failure(error)
    })
  }
  
  class func saveUserSession(fromResponse response: [String: Any], headers: [AnyHashable: Any]) {
    UserDataManager.currentUser = User(dictionary: response["user"] as? [String: Any] ?? [:])
    if let headers = headers as? [String: Any] {
      SessionManager.currentSession = Session(headers: headers)
    }
  }
}
