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
      }
      
      TextField(data.title, text: $data.value)
      
      if !data.isValid && !data.isEmpty {
        Text(data.errorMessage)
          .frame(maxWidth: .infinity, alignment: .leading)
          .font(.subheadline)
          .foregroundColor(.red)
      }
    }
    .padding(.horizontal, 10)
  }
}

struct TextFieldView_Previews: PreviewProvider {
  static var previews: some View {
    TextFieldView(data: TextFieldData(title: "email"))
  }
}
