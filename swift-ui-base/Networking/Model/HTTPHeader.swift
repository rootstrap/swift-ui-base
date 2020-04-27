//
//  HTTPHeader.swift
//  swift-ui-base
//
//  Created by Germán Stábile on 4/1/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import Foundation

enum HTTPHeader: String {
  case uid = "uid"
  case client = "client"
  case token = "access-token"
  case expiry = "expiry"
  case accept = "Accept"
  case contentType = "Content-Type"
}
