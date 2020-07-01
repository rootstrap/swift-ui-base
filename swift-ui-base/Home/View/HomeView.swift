//
//  ContentView.swift
//  swift-ui-base
//
//  Created by Germán Stábile on 3/10/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import SwiftUI

struct HomeView: View {
  
  var body: some View {
    NavigationView {
      VStack {
        Spacer()
        
        Text("Welcome to RS SwiftUI base!")
          .modifier(MainTitle())
        
        Spacer()
        
        NavigationLink(destination: LoginView()) {
          Text("Log In")
            .frame(width: 300, height: 50)
            .font(.subheadline)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding(.bottom, 20)
        }
        .accessibility(identifier: "GoToLoginLink")
        
        NavigationLink(destination: SignUpView()) {
          Text("Don't have an account? Lets create one! ►")
            .frame(width: 300, height: 50)
            .font(.subheadline)
            .foregroundColor(.gray)
            .cornerRadius(8)
        }
        .accessibility(identifier: "GoToSignUpLink")
  
        Spacer()
      }
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
