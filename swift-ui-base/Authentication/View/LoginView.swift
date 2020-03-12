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
    errorMessage: "Please enter a valid password"
  )
  
  var isDataValid: Bool {
    return [emailData, passwordData].allSatisfy { $0.isValid }
  }
  
  var body: some View {
    VStack{
      Text("Sign In")
        .font(.title)
      
      Spacer()
      
      TextFieldView(data: emailData)
      
      Spacer().frame(maxHeight: 20)
      
      TextFieldView(data: passwordData)
      
      Spacer()
      
      Button(action: {
        self.printUserName()
      }, label: {
        Text("Sign In")
          .font(.headline)
      }).disabled(!isDataValid)
      
      Spacer()
    }
  }
  
  func printUserName() {
    print("username is \(emailData.value)")
    print("password is \(passwordData.value)")
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
