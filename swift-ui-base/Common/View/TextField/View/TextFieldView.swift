//
//  TextFieldView.swift
//  swift-ui-base
//
//  Created by Germán Stábile on 3/10/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import SwiftUI

struct TextFieldView: View {
  @Binding var value: String
  @Binding var isValid: Bool
  @Binding var hasTyped: Bool
  @State var title: String
  @State var errorMessage: String
  @State var isSecure = false
  
  var body: some View {
    VStack {
      if !value.isEmpty {
        Text(title)
          .frame(maxWidth: .infinity, alignment: .leading)
          .font(.subheadline)
          .foregroundColor(.lightGray)
      }
      
      ZStack {
        if value.isEmpty {
          Text(title)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(Font.headline.weight(.regular))
            .foregroundColor(.lightGray)
            .opacity(0.7)
        }
        
        if isSecure {
          SecureField("", text: $value)
            .foregroundColor(.darkGray)
            .autocapitalization(.none)
        } else {
          TextField("", text: $value)
            .foregroundColor(.darkGray)
            .autocapitalization(.none)
            .opacity(0.8)
        }
      }
      
      Rectangle()
        .frame(maxWidth: .infinity, maxHeight: 1)
        .foregroundColor(!isValid && hasTyped ? .errorRed : .lightGray)
        .opacity(0.5)
      
      if !isValid && hasTyped {
        Text(errorMessage)
          .frame(maxWidth: .infinity, alignment: .leading)
          .font(.footnote)
          .foregroundColor(.errorRed)
      }
    }
    .padding(.horizontal, 20)
  }
}
