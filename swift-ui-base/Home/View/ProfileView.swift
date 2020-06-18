//
//  ProfileView.swift
//  swift-ui-base
//
//  Created by Germán Stábile on 3/24/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    
  @State var isShowingImagePicker = false
  @State private var image: Image?
  
  @ObservedObject var viewModel = ProfileViewModel()
    
  var body: some View {
    ZStack {
      ActivityIndicatorView(isAnimating: $viewModel.isLoading, style: .medium)
      
      VStack {
        Spacer().frame(height: 70)
        
        AvatarView(
          image: $image,
          isShowingImagePicker: $isShowingImagePicker
        )
        
        Spacer()
          .frame(height: 10)
        
        Text("Welcome \(viewModel.username)")
          .modifier(TitleModifier())
        
        Spacer()
        
        buttons
        
        Spacer().frame(height: 60)
        
        .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
          ImagePicker(image: self.$viewModel.image)
        }
        
        .alert(isPresented: $viewModel.shouldShowAlert) {
          if !viewModel.errorDescription.isEmpty {
            return Alert(title: Text("Oops"), message: Text(viewModel.errorDescription))
          } else {
            return Alert(title: Text("Profile loaded"), message: Text(viewModel.username))
          }
        }
      }
      .disabled(viewModel.isLoading)
      .blur(radius: viewModel.isLoading ? 3 : 0)
    }
  }
  
  var saveAvatarButtonColor: Color {
    let opacity = $image.wrappedValue == nil ? 0.5 : 1
    return Color.green.opacity(opacity)
  }
  
  var buttons: some View {
    VStack {
      Button(action: { self.saveAvatar() }) {
        Text("Save Avatar")
          .modifier(RoundedButtonModifier(backgroundColor: saveAvatarButtonColor))
      }
      .disabled($image.wrappedValue == nil)
      
      Spacer().frame(height: 10)
      
      Button(action: { self.getMyProfile() }) {
        Text("Get my profile")
          .modifier(RoundedButtonModifier(backgroundColor: Color.blue))
      }
      
      Spacer().frame(height: 10)
      
      Button(action: { self.logoutButtonTapped() }) {
        Text("Log out")
          .modifier(RoundedButtonModifier(backgroundColor: Color.red))
      }
    }
  }
  
  func logoutButtonTapped() {
    viewModel.logout()
    ViewRouter.shared.currentRoot = .home
  }
  
  func saveAvatar() {
    viewModel.saveAvatar()
  }
  
  func getMyProfile() {
    viewModel.getMyProfile()
  }
  
  func loadImage() {
    guard let inputImage = viewModel.image else { return }
    image = Image(uiImage: inputImage)
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView()
  }
}
