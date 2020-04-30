//
//  ViewRouter.swift
//  swift-ui-base
//
//  Created by Germán Stábile on 3/13/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import Foundation
import Combine

enum Roots {
  case home
  case profile
}

class ViewRouter: ObservableObject {
  @Published var currentRoot: Roots = SessionManager.isValidSession ? .profile : .home
  
  static let shared = ViewRouter()
  
  fileprivate init() { }
}
