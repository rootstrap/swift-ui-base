//
//  AvatarView.swift
//  swift-ui-base
//
//  Created by Germán Stábile on 6/9/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import SwiftUI

struct AvatarView: View {
  
  @Binding var image: Image?
  @Binding var isShowingImagePicker: Bool
  
  var body: some View {
    ZStack(alignment: .bottomTrailing) {
      
      avatarImage
        .resizable()
        .frame(width: 100, height: 100)
        .clipShape(Circle())
      
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
  }
  
  var avatarImage: Image {
    image ?? Image("user_avatar_placeholder")
  }
  
  func editAvatarButtonTapped() {
    isShowingImagePicker = true
  }
}
