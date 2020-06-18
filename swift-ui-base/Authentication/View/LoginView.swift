//
//  LoginView.swift
//  swift-ui-base
//
//  Created by Germán Stábile on 3/10/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import SwiftUI

struct LoginView: View {
  
  @ObservedObject var viewModel = LoginViewModel()
  
  var body: some View {
    ZStack {
      ActivityIndicatorView(isAnimating: $viewModel.isLoading, style: .medium)
      
      VStack {
        Text("Sign In")
          .modifier(TitleModifier())
        
        Spacer()
        
        TextFieldView(fieldData: $viewModel.emailData)
        
        Spacer().frame(height: 30)
        
        TextFieldView(fieldData: $viewModel.passwordData)
        
        Spacer()
        
        Button(action: { self.loginButtonTapped() }) {
          Text("Sign In")
            .font(.headline)
        }
        .accessibility(identifier: "SignInButton")
        .disabled(!viewModel.isValidData)
        
        Spacer()
      }
      .disabled(viewModel.isLoading)
      .blur(radius: viewModel.isLoading ? 3 : 0)
      .alert(isPresented: $viewModel.errored) {
        Alert(title: Text("Oops"),
              message: Text(viewModel.error),
              dismissButton: .default(Text("Got it!")))
      }
    }
  }
  
  func loginButtonTapped() {
    viewModel.attemptSignin()
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
