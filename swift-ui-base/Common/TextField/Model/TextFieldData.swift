//
//  TextFieldData.swift
//  swift-ui-base
//
//  Created by Germán Stábile on 3/11/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import Foundation

final class TextFieldData: ObservableObject {
  @Published var value: String = "" {
    willSet {
      isValid = value.isValid(type: validationType)
    }
  }
  var validationType: ValidationType
  var errorMessage: String
  var title: String
  @Published var isValid: Bool = true
  
  var isEmpty: Bool {
    return value.isEmpty
  }
  
  init(title: String,
       value: String = "",
       validationType: ValidationType = .none,
       errorMessage: String = "") {
    self.title = title
    self.value = value
    self.validationType = validationType
    self.errorMessage = errorMessage
  }
}
