//
//  ProfileView.swift
//  swift-ui-base
//
//  Created by Germán Stábile on 3/24/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
      NavigationView {
        VStack {
          Spacer()
          
          Text("This is the profile view")
            .modifier(TitleModifier())
          
          Spacer()
          
          Button(action: { self.logout() })
          {
            Text("Log out")
              .frame(width: 300, height: 50)
              .font(.subheadline)
              .background(Color.blue)
              .foregroundColor(.white)
              .cornerRadius(8)
          }
          
          Spacer()
        }
      }
    }
  
  func logout() {
    ViewRouter.shared.currentRoot = .home
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView()
  }
}
