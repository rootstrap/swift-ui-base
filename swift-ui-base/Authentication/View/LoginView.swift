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
          .padding(.bottom, 30)
        
        TextFieldView(fieldData: $viewModel.passwordData)
        
        Spacer()
        
        Button(action: {
          self.loginButtonTapped()
        }, label: {
          Text("Sign In")
            .font(.headline)
        })
          .disabled(!viewModel.isValidData)
          .alert(isPresented: $viewModel.errored) {
            Alert(title: Text("Oops"),
                  message: Text(viewModel.error),
                  dismissButton: .default(Text("Got it!")))
        }
        
        Spacer()
      }
      .disabled(viewModel.isLoading)
      .blur(radius: viewModel.isLoading ? 3 : 0)
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
