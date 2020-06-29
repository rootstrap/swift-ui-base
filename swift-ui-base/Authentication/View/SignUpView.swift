//
//  SignUpView.swift
//  swift-ui-base
//
//  Created by Germán Stábile on 3/10/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
  @ObservedObject var viewModel = SignUpViewModel()
  
  var body: some View {
    ZStack {
      ActivityIndicatorView(isAnimating: $viewModel.isLoading, style: .medium)
      
      VStack {
        Text("Sign Up")
          .modifier(TitleModifier())
        
        Spacer()
        
        TextFieldView(fieldData: $viewModel.emailData)
        
        Spacer().frame(height: 30)
        
        TextFieldView(fieldData: $viewModel.passwordData)
        
        Spacer().frame(height: 30)
        
        TextFieldView(fieldData: $viewModel.confirmPasswordData)
        
        Spacer()
        
        Button(action: signUpButtonTapped, label: {
          Text("Sign Up")
            .font(.headline)
        })
          .accessibility(identifier: "SignUpButton")
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
  
  func signUpButtonTapped() {
    viewModel.attemptSingUp()
  }
}

struct SignUpView_Previews: PreviewProvider {
  static var previews: some View {
    SignUpView()
  }
}
