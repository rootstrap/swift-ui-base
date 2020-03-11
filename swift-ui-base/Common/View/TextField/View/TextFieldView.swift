//
//  TextFieldView.swift
//  swift-ui-base
//
//  Created by Germán Stábile on 3/10/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import SwiftUI

struct TextFieldView: View {
  @ObservedObject var data = TextFieldData(title: "")
  
  var body: some View {
    VStack {
      if !data.isEmpty {
        Text(data.title)
          .frame(maxWidth: .infinity, alignment: .leading)
          .font(.subheadline)
          .foregroundColor(.lightGray)
      }
      
      ZStack {
        if data.value.isEmpty {
          Text(data.title)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(Font.headline.weight(.regular))
            .foregroundColor(.lightGray)
            .opacity(0.7)
        }
        
        if data.isSecure {
          SecureField("", text: $data.value)
            .foregroundColor(.darkGray)
            .autocapitalization(.none)
        } else {
          TextField("", text: $data.value)
            .foregroundColor(.darkGray)
            .autocapitalization(.none)
            .opacity(0.8)
        }
      }
      
      Rectangle()
        .frame(maxWidth: .infinity, maxHeight: 1)
        .foregroundColor(!data.isValid && data.hasTyped ? .errorRed : .lightGray)
        .opacity(0.5)
      
      if !data.isValid && data.hasTyped {
        Text(data.errorMessage)
          .frame(maxWidth: .infinity, alignment: .leading)
          .font(.footnote)
          .foregroundColor(.errorRed)
      }
    }
    .padding(.horizontal, 20)
  }
}

struct TextFieldView_Previews: PreviewProvider {
  static var previews: some View {
    TextFieldView(data: TextFieldData(
      title: "Email",
      value: "jhggjhg",
      validationType: .email,
      errorMessage: "Please enter a valid email"
    ))
  }
}
