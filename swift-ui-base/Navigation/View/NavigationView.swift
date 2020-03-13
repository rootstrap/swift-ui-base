//
//  NavigationView.swift
//  swift-ui-base
//
//  Created by Germán Stábile on 3/13/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import SwiftUI

struct NavigationView: View {
  
  @EnvironmentObject var router: ViewRouter
  
  var body: some View {
    containedView().transition(.slide)
  }
  
  func containedView() -> AnyView {
    switch router.currentScreen {
    case .login:
      let loginViewModel = LoginViewModel(router: router)
      return AnyView(LoginView(viewModel: loginViewModel))
    case .signUp:
      return AnyView(SignUpView())
    default:
      return AnyView(HomeView().environmentObject(router))
    }
  }
}
