//
//  UserProfileRequest.swift
//  BostaTask
//
//  Created by name on 15/09/2025.
//

import Foundation
import Moya

struct UserProfileRequest: TargetType {
  let userId: Int

  var path: String {"/users/\(userId)"}
  var method: Moya.Method {.get}
  var task: Moya.Task {.requestPlain}
}
