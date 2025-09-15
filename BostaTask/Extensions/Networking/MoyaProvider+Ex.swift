//
//  MoyaProvider+Ex.swift
//  BostaTask
//
//  Created by name on 15/09/2025.
//

import Foundation
import Moya
import Combine

extension MoyaProvider {
  func requestPublisher(_ target: Target) -> AnyPublisher<Response, MoyaError> {
    Future<Response, MoyaError> { [weak self] promise in
      self?.request(target) { result in
        switch result {
        case let .success(response):
          promise(.success(response))
        case let .failure(error):
          promise(.failure(error))
        }
      }
    }
    .eraseToAnyPublisher()
  }
}
