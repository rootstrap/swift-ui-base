//
//  User.swift
//  ios-base
//
//  Created by Rootstrap on 1/18/17.
//  Copyright © 2017 Rootstrap. All rights reserved.
//

import Foundation

struct User: Codable {
  var id: Int
  var username: String
  var email: String
  var imageURL: URL?
  
  private enum CodingKeys: String, CodingKey {
    case id
    case username
    case email
    case imageURL = "profile_picture"
  }
  
  init?(dictionary: [String: Any]) {
    guard
      let id = dictionary[CodingKeys.id.rawValue] as? Int,
      let username = dictionary[CodingKeys.username.rawValue] as? String,
      let email = dictionary[CodingKeys.email.rawValue] as? String
    else {
        return nil
    }
    
    self.id = id
    self.username = username
    self.email = email
    self.imageURL = URL(
      string: dictionary[CodingKeys.imageURL.rawValue] as? String ?? ""
    )
  }
  
  init(id: Int, username: String, email: String, imageURL: URL? = nil) {
    self.id = id
    self.username = username
    self.email = email
    self.imageURL = imageURL
  }
}
