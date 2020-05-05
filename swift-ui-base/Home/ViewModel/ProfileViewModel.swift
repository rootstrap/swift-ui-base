//
//  ProfileViewModel.swift
//  swift-ui-base
//
//  Created by Germán Stábile on 4/30/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import Foundation

class ProfileViewModel {
    
  func logout() {
    UserDataManager.deleteUser()
    SessionManager.deleteSession()
  }
}
