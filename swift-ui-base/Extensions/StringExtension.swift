//
//  StringExtension.swift
//  swift-ui-base
//
//  Created by Germán Stábile on 3/10/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import Foundation

enum ValidationType {
  case email
  case nonEmpty
  case numeric
  case date
  case phone
  case none
  case custom(isValid: () -> Bool)
}

extension String {
  var isAlphanumericWithNoSpaces: Bool {
    return rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) == nil
  }
  
  var hasPunctuationCharacters: Bool {
    return rangeOfCharacter(from: CharacterSet.punctuationCharacters) != nil
  }
  
  var hasNumbers: Bool {
    return rangeOfCharacter(from: CharacterSet(charactersIn: "0123456789")) != nil
  }
  
  var length: Int {
    return count
  }
  
  var localized: String {
    return self.localize()
  }
  
  func localize(comment: String = "") -> String {
    return NSLocalizedString(self, comment: comment)
  }
  
  var validFilename: String {
    guard !isEmpty else { return "emptyFilename" }
    return addingPercentEncoding(withAllowedCharacters: .alphanumerics) ?? "emptyFilename"
  }
  
  func isValid(type: ValidationType, isRequired: Bool = true) -> Bool {
    guard isRequired || !isEmpty else { return true }
    switch type {
    case .email:
      return isEmailFormatted()
    case .numeric:
      return isInteger()
    case .phone:
      return isPhoneNumber()
    case .none:
      return true
    case .custom(isValid: let validationBlock):
      return validationBlock()
    default:
      return !isEmpty
    }
  }
  
  //Regex fulfill RFC 5322 Internet Message format
  func isEmailFormatted() -> Bool {
    let predicate = NSPredicate(
      format: "SELF MATCHES %@",
      "[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+(\\.[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+)*@([A-Za-z0-9]([A-Za-z0-9-]*[A-Za-z0-9])?\\.)+[A-Za-z0-9]([A-Za-z0-9-]*[A-Za-z0-9])?"
    )
    return predicate.evaluate(with: self)
  }
  
  func isInteger() -> Bool {
    return Int(self) != nil
  }
  
  func isPhoneNumber() -> Bool {
    let phoneTest = NSPredicate(format: "SELF MATCHES %@", "^\\d{3}-\\d{3}-\\d{4}$")
    return phoneTest.evaluate(with: self)
  }
}
