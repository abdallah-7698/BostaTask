//
//  AlbumPhotosRequest.swift
//  BostaTask
//
//  Created by name on 15/09/2025.
//

import Foundation
import Moya

struct AlbumPhotosRequest: TargetType {
  let albumId: Int

  var path: String {"/photos"}
  var method: Moya.Method {.get}
  var task: Moya.Task {.requestParameters(parameters: ["albumId": albumId], encoding: URLEncoding.default)}
}
