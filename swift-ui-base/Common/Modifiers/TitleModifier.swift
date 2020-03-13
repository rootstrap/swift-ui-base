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
