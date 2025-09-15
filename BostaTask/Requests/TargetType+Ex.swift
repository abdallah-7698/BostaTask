//
//  TargetType+Ex.swift
//  BostaTask
//
//  Created by name on 15/09/2025.
//
import Moya
import Foundation


extension TargetType {
  var baseURL: URL {
    return URL(string: "https://jsonplaceholder.typicode.com")!
  }
  
  var headers: [String : String]? {
    return ["Content-Type": "application/json"]
  }
}
