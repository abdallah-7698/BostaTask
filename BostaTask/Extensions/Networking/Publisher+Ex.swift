//
//  Publisher+Ex.swift
//  BostaTask
//
//  Created by name on 15/09/2025.
//

import Foundation
import Combine

extension Publisher {
  func assignLoading<T: AnyObject>(
    to keyPath: ReferenceWritableKeyPath<T, Bool>,
    on object: T
  ) -> AnyPublisher<Output, Failure> {
    handleEvents(
      receiveSubscription: { [weak object] _ in
        DispatchQueue.main.async {
          object?[keyPath: keyPath] = true
        }
      },
      receiveCompletion: { [weak object] _ in
        DispatchQueue.main.async {
          object?[keyPath: keyPath] = false
        }
      }
    )
    .eraseToAnyPublisher()
  }

  func assignError<T: AnyObject>(
    to keyPath: ReferenceWritableKeyPath<T, String?>,
    on object: T
  ) -> AnyPublisher<Output, Failure> {
    handleEvents(
      receiveSubscription: { [weak object] _ in
        DispatchQueue.main.async {
          object?[keyPath: keyPath] = nil
        }
      },
      receiveCompletion: { [weak object] completion in
        if case let .failure(error) = completion {
          DispatchQueue.main.async {
            object?[keyPath: keyPath] = error.localizedDescription
          }
        }
      }
    )
    .eraseToAnyPublisher()
  }
}
