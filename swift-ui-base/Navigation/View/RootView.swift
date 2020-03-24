//
//  NavigationView.swift
//  swift-ui-base
//
//  Created by Germán Stábile on 3/13/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import SwiftUI

struct RootView: View {
  
  @EnvironmentObject var router: ViewRouter
  
  var body: some View {
    VStack {
      containedView()
        .id(router.currentRoot)
        .transition(.slide).animation(.linear(duration: 0.2))
    }
  }
  
  func containedView() -> AnyView {
    switch router.currentRoot {
    case .profile:
      return AnyView(ProfileView())
    default:
      return AnyView(HomeView())
    }
  }
}
