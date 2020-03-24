//
//  LoginView.swift
//  swift-ui-base
//
//  Created by Germán Stábile on 3/10/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import SwiftUI

struct LoginView: View {
  
  @ObservedObject var viewModel: LoginViewModel
  @State private var isShowingAlert = false
  
  var body: some View {
    ZStack {
      ActivityIndicatorView(isAnimating: $viewModel.isLoading, style: .medium)
      
      VStack{
        Text("Sign In")
          .modifier(TitleModifier())
        
        Spacer()
        
        TextFieldView(
          value: $viewModel.emailData.value,
          isValid: $viewModel.emailData.isValid,
          hasTyped: $viewModel.emailData.hasTyped,
          title: viewModel.emailData.title,
          errorMessage: viewModel.emailData.errorMessage
        )
        
        Spacer().frame(height: 30)
        
        TextFieldView(
          value: $viewModel.passwordData.value,
          isValid: $viewModel.passwordData.isValid,
          hasTyped: $viewModel.passwordData.hasTyped,
          title: viewModel.passwordData.title,
          errorMessage: viewModel.passwordData.errorMessage,
          isSecure: true
        )
        
        Spacer()
        
        Button(action: {
          self.loginButtonTapped()
        }, label: {
          Text("Sign In")
            .font(.headline)
        })
          .disabled(!viewModel.isValidData)
          .alert(isPresented: $isShowingAlert) {
            Alert(title: Text("Sign in tapped"),
                  message: Text("username: \(viewModel.emailData.value) \npassword: \(viewModel.passwordData.value)"),
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
    LoginView(viewModel: LoginViewModel(router: ViewRouter()))
  }
}
