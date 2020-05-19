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
      NavigationView {
        VStack {
          Spacer()
            .frame(height: 30)
          
          ZStack(alignment: .bottomTrailing) {

            if image != nil {
              image?
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            } else {
              Image("user_avatar_placeholder")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            }
            
            Button(action: { self.editAvatarButtonTapped() }) {
              Image("edit_icon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .foregroundColor(.darkGray)
              
            }
            .padding(EdgeInsets(
              top: 0,
              leading: 0,
              bottom: 10,
              trailing: 0
            ))
          }
          
          Spacer()
            .frame(height: 10)
          
          Text("Welcome \(viewModel.username)")
            .modifier(TitleModifier())
          
          Spacer()
          
          Button(action: { self.logoutButtonTapped() })
          {
            Text("Log out")
              .frame(width: 300, height: 50)
              .font(.subheadline)
              .background(Color.blue)
              .foregroundColor(.white)
              .cornerRadius(8)
          }

          Spacer()
          
          .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$viewModel.image)
          }
        }
      }
    }
  
  func logoutButtonTapped() {
    viewModel.logout()
    ViewRouter.shared.currentRoot = .home
  }
  
  func editAvatarButtonTapped() {
    isShowingImagePicker = true
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
