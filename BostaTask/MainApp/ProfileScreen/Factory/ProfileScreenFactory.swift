//
//  ProfileScreenFactory.swift
//  BostaTask
//
//  Created by name on 14/09/2025.
//

import UIKit

struct ProfileScreenFactory {
  static func makeViewContrller(navigationController: UINavigationController?) -> ProfileScreenViewController {
    let viewModel = ProfileScreenViewModel(router: .live(navigationController: navigationController))
    return ProfileScreenViewController(viewModel: viewModel)
  }
}
