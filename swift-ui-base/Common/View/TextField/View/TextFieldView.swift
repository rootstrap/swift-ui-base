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
      ZStack {
        Text(fieldData.title)
          .frame(maxWidth: .infinity, alignment: .leading)
          .font(Font.headline.weight(.regular))
          .foregroundColor(.cadetBlue)
          .offset(CGSize(width: 0, height: fieldData.isEmpty ? 0 : -30))
          .opacity(fieldData.isEmpty ? 0.7 : 1)
          .animation(.easeOut(duration: 0.2))
          .scaleEffect(fieldData.isEmpty ? 1 : 0.8, anchor: .bottomLeading)
        
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
          !fieldData.isEmpty && !fieldData.isValid ? .errorRed : .cadetBlue
        )
        .opacity(0.5)
      
      Text(fieldData.errorMessage)
        .frame(maxWidth: .infinity, alignment: .leading)
        .offset(CGSize(width: 0, height: -5))
        .font(.footnote)
        .foregroundColor(.errorRed)
        .opacity(!fieldData.isEmpty && !fieldData.isValid ? 1 : 0)
        .animation(.easeOut(duration: 0.2))
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
