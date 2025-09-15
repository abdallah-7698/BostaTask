//
//  ProfileScreenViewController.swift
//  BostaTask
//
//  Created by name on 14/09/2025.
//

import Combine
import UIKit

class ProfileScreenViewController: UIViewController {
  private let headerView = NameAndAddressView()
  private let albumsTableView = AlbumsTableView()

  private let viewModel = ProfileScreenViewModel()
  private var cancellables = Set<AnyCancellable>()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    addUICompoents()
    bindViewModel()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    viewModel.fetchUserData()
  }

  private func setupView() {
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.title = "Porfile"
    view.backgroundColor = .systemBackground
  }

  private func addUICompoents() {
    view.addSubviews(headerView, albumsTableView)

    headerView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                      leading: view.leadingAnchor,
                      trailing: view.trailingAnchor,
                      padding: .init(top: 16, left: 16, bottom: 0, right: 16),
                      size: .init(width: 0, height: 80))

    albumsTableView.anchor(top: headerView.bottomAnchor,
                           leading: view.leadingAnchor,
                           trailing: view.trailingAnchor,
                           bottom: view.bottomAnchor)
  }

  private func bindViewModel() {
    viewModel.$albums
      .sink { [weak self] model in
        guard let self = self else { return }
        self.albumsTableView.update(with: model)
      }
      .store(in: &cancellables)

    viewModel.$profile
      .sink { [weak self] profile in
        guard let self = self else { return }
        self.headerView.configure(model: profile)
      }
      .store(in: &cancellables)

    viewModel.$isLoading
      .sink { [weak self] loading in
        guard let self = self else { return }
        self.view.showLoading(loading)
      }
      .store(in: &cancellables)

    viewModel.$error
      .sink { [weak self] error in
        guard let self = self else { return }
        view.showErrorView(message: error, onRetry: {
          self.viewModel.fetchUserData()
        })
      }
      .store(in: &cancellables)
  }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ViewController_Preview: PreviewProvider {
  static var previews: some View {
    UINavigationController(rootViewController: ProfileScreenViewController())
      .showPreview()
  }
}
#endif
