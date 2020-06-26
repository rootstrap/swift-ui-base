//
//  RoundedButtonModifier.swift
//  swift-ui-base
//
//  Created by Germán Stábile on 6/9/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import SwiftUI

struct MainRoundedButton: ViewModifier {
  
  var backgroundColor: Color = .blue
  var radius: CGFloat = 8
  
  func body(content: Content) -> some View {
    content
      .frame(width: 300, height: 50)
      .font(.headline)
      .foregroundColor(.white)
      .background(backgroundColor)
      .cornerRadius(radius)
  }
}

struct MainRoundedButton_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      Text("Hello, World!")
        .padding()
        .previewLayout(.sizeThatFits)
      
      Text("Hello, World!")
        .modifier(MainRoundedButton())
        .padding()
        .previewLayout(.sizeThatFits)
    }
  }
}
