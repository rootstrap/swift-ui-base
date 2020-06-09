//
//  RoundedButtonModifier.swift
//  swift-ui-base
//
//  Created by Germán Stábile on 6/9/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import SwiftUI

struct RoundedButtonModifier: ViewModifier {
  
  var backgroundColor: Color
  
  func body(content: Content) -> some View {
    content
      .frame(width: 300, height: 50)
      .font(.headline)
      .foregroundColor(.white)
      .background(backgroundColor)
      .cornerRadius(8)
  }
}
