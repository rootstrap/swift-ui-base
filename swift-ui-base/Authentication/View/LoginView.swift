//
//  LoginView.swift
//  swift-ui-base
//
//  Created by Germán Stábile on 3/10/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import SwiftUI

struct LoginView: View {
  
  @ObservedObject var emailData = TextFieldData(
    title: "Email",
    validationType: .email,
    errorMessage: "Please enter a valid email"
  )
  
  @ObservedObject var passwordData = TextFieldData(
    title: "Password",
    validationType: .nonEmpty,
    isSecure: true,
    errorMessage: "Please enter a valid password"
  )
  
  @State private var isShowingAlert = false
  
  var isDataValid: Bool {
    return [emailData, passwordData].allSatisfy { $0.isValid }
  }
  
  var body: some View {
    VStack{
      Text("Sign In")
        .modifier(TitleModifier())
      
      Spacer()
      
      TextFieldView(data: emailData)
      
      Spacer().frame(height: 30)
      
      TextFieldView(data: passwordData)
      
      Spacer()
      
      Button(action: {
        self.isShowingAlert = true
      }, label: {
        Text("Sign In")
          .font(.headline)
      })
        .disabled(!isDataValid)
        .alert(isPresented: $isShowingAlert) {
          Alert(title: Text("Sign in tapped"),
                message: Text("username: \(emailData.value) \npassword: \(passwordData.value)"),
                dismissButton: .default(Text("Got it!")))
      }
      
      Spacer()
    }
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
