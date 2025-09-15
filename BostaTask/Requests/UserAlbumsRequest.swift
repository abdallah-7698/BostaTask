//
//  UserAlbumsRequest.swift
//  BostaTask
//
//  Created by name on 15/09/2025.
//

import Foundation
import Moya

struct UserAlbumsRequest: TargetType {
  let userId: Int

  var path: String {"/albums"}
  var method: Moya.Method {.get}
  var task: Moya.Task {.requestParameters(parameters: ["userId": userId], encoding: URLEncoding.default)}
}
