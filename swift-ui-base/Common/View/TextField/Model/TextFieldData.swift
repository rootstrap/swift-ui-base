//
//  TextFieldData.swift
//  swift-ui-base
//
//  Created by Germán Stábile on 3/11/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import Foundation

final class TextFieldData: Identifiable {
  var value: String = "" {
    didSet {
      hasTyped = hasTyped || !value.isEmpty
      validate()
    }
  }
  var validationType: ValidationType
  var errorMessage: String
  var title: String
  var isSecure = false
  var hasTyped = false
  var isValid = true
  
  var isEmpty: Bool {
    return value.isEmpty
  }
  
  deinit {
    print("deinit called for \(title)")
  }
  
  init(title: String,
       value: String = "",
       validationType: ValidationType = .none,
       isSecure: Bool = false,
       errorMessage: String = "") {
    self.title = title
    self.value = value
    self.validationType = validationType
    self.errorMessage = errorMessage
    self.isSecure = isSecure
    validate()
    print("init called for \(title)")
  }
  
  func validate() {
    isValid = value.isValid(type: validationType)
  }
}
