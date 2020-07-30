//
//  UserDataManager.swift
//  ios-base
//
//  Created by Rootstrap on 15/2/16.
//  Copyright © 2016 Rootstrap. All rights reserved.
//

import UIKit

class UserDataManager: NSObject {
    
 static private let userDefaultUserKey = "swift-ui-base-user"
  
  static var currentUser: User? {
    get {
      let defaults = UserDefaults.standard
      if
        let data = defaults.data(forKey: userDefaultUserKey),
        let user = try? JSONDecoder().decode(User.self, from: data)
      {
        return user
      }
      return nil
    }
    
    set {
      let user = try? JSONEncoder().encode(newValue)
      UserDefaults.standard.set(user, forKey: userDefaultUserKey)
    }
  }
  
  class func deleteUser() {
    UserDefaults.standard.removeObject(forKey: userDefaultUserKey)
  }
  
  static var isUserLogged: Bool {
    return currentUser != nil
  }
}
