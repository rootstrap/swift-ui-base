//
//  ContentView.swift
//  swift-ui-base
//
//  Created by Germán Stábile on 3/10/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import SwiftUI

struct HomeView: View {
  @EnvironmentObject var router: ViewRouter
  
  var body: some View {
    VStack {
      Spacer()
      
      Text("Welcome to RS SwiftUI base!")
        .modifier(TitleModifier())
      
      Spacer()
      
      Button(action: {
        self.goToLogin()
      }, label: {
        Text("Log In")
          .frame(width: 300, height: 50)
          .font(.subheadline)
          .background(Color.blue)
          .foregroundColor(.white)
          .cornerRadius(8)
      })
      
      Spacer()
        .frame(maxHeight: 20)
      
      Button(action: {
        self.goToSignUp()
      }, label: {
        Text("Don't have an account? Lets create one! ►")
          .frame(width: 300, height: 50)
          .font(.subheadline)
          .foregroundColor(.gray)
          .cornerRadius(8)
      })
      
      Spacer()
    }
  }
  
  func goToLogin() {
    router.currentScreen = .login
  }
  
  func goToSignUp() {
    router.currentScreen = .signUp
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
