//
//  ProfileViewModel.swift
//  swift-ui-base
//
//  Created by Germán Stábile on 4/30/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewModel: ObservableObject, Identifiable {
    
  @Published var image: UIImage?
  
  var username: String {
    return UserDataManager.currentUser?.email ?? ""
  }
  
  func logout() {
    UserDataManager.deleteUser()
    SessionManager.deleteSession()
  }
}
