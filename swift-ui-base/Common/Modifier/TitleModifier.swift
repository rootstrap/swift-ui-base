//
//  TitleModifier.swift
//  swift-ui-base
//
//  Created by Germán Stábile on 3/11/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import SwiftUI

struct TitleModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding()
      .foregroundColor(.darkGray)
      .font(.largeTitle)
  }
}

struct TitleModifier_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      Text("Hello, World!")
        .previewLayout(.sizeThatFits)
      
      Text("Hello, World!")
      .modifier(TitleModifier())
      .previewLayout(.sizeThatFits)
    }
  }
}
