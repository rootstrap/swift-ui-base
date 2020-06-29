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
  @Published var shouldShowAlert = false
  @Published var errorDescription = ""
  
  var username: String {
    return UserDataManager.currentUser?.email ?? ""
  }
  
  func logout() {
    AuthenticationServices.logout()
  }
  
  func deleteAccount() {
    AuthenticationServices.deleteAccount()
  }
  
  func getMyProfile() {
    isLoading = true
    UserServices.getMyProfile(
      success: { [weak self] _ in
        self?.errorDescription = ""
        self?.shouldShowAlert = true
        self?.isLoading = false
      },
      failure: { [weak self] error in
        self?.isLoading = false
        self?.shouldShowAlert = true
        self?.errorDescription = error.localizedDescription
    })
  }
  
  func saveAvatar() {
    //TODO
    //guard let image = image else { return }
    isLoading = true
  }
}
