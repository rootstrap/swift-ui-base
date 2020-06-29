//
//  TextFieldView.swift
//  swift-ui-base
//
//  Created by Germán Stábile on 3/10/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import SwiftUI

struct TextFieldView: View {
  
  @Binding var fieldData: TextFieldData
  
  var body: some View {
    VStack {
      if !fieldData.value.isEmpty {
        Text(fieldData.title)
          .frame(maxWidth: .infinity, alignment: .leading)
          .font(.subheadline)
          .foregroundColor(.lightGray)
      }
      
      ZStack {
        if fieldData.value.isEmpty {
          Text(fieldData.title)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(Font.headline.weight(.regular))
            .foregroundColor(.lightGray)
            .opacity(0.7)
        }
        
        if fieldData.isSecure {
          SecureField("", text: $fieldData.value)
            .foregroundColor(.darkGray)
            .autocapitalization(.none)
            .accessibility(identifier: "\(fieldData.title.withNoSpaces)TextField")
        } else {
          TextField("", text: $fieldData.value)
            .foregroundColor(.darkGray)
            .autocapitalization(.none)
            .opacity(0.8)
            .accessibility(identifier: "\(fieldData.title.withNoSpaces)TextField")
        }
      }
      
      Rectangle()
        .frame(maxWidth: .infinity, maxHeight: 1)
        .foregroundColor(
          !fieldData.isValid && fieldData.hasTyped ? .errorRed : .lightGray
        )
        .opacity(0.5)
      
      if !fieldData.isValid && fieldData.hasTyped {
        Text(fieldData.errorMessage)
          .frame(maxWidth: .infinity, alignment: .leading)
          .font(.footnote)
          .foregroundColor(.errorRed)
      }
    }
    .padding(.horizontal, 20)
  }
}

struct TextFieldView_Previews: PreviewProvider {
  
  struct BindingTestHolder: View {
    @State var fieldData = TextFieldData(
      title: "Email",
      value: "testy@testerson",
      validationType: .email,
      hasTyped: true,
      errorMessage: "Please enter a valid email"
    )
    
    var body: some View {
      TextFieldView(fieldData: $fieldData)
    }
  }
  
  static var previews: some View {
    BindingTestHolder()
  }
}
