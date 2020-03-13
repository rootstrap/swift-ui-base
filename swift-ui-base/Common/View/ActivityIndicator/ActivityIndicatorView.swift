//
//  ActivityIndicatorView.swift
//  swift-ui-base
//
//  Created by Germán Stábile on 3/13/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
  
  @Binding var isAnimating: Bool
  let style: UIActivityIndicatorView.Style
  
  func makeUIView(
    context: UIViewRepresentableContext<ActivityIndicatorView>
  ) -> UIActivityIndicatorView {
    return UIActivityIndicatorView(style: style)
  }
  
  func updateUIView(
    _ uiView: UIActivityIndicatorView,
    context: UIViewRepresentableContext<ActivityIndicatorView>
  ) {
    isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
  }
}
