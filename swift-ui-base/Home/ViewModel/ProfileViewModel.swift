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
  @Published var isLoading = false
  @Published var profileEmailLoaded = false
  @Published var errorDescription = ""
  @Published var errored = false
  
  var username: String {
    return UserDataManager.currentUser?.email ?? ""
  }
  
  func logout() {
    UserDataManager.deleteUser()
    SessionManager.deleteSession()
  }
  
  func getMyProfile() {
    isLoading = true
    UserServices.getMyProfile(
      success: { [weak self] user in
        self?.profileEmailLoaded = true
        self?.isLoading = false
      },
      failure: { [weak self] error in
        self?.isLoading = false
        self?.errored = true
        self?.errorDescription = error.localizedDescription
    })
  }
  
  func saveAvatar() {
    //TODO
    //guard let image = image else { return }
    isLoading = true
  }
}
