//
//  ProfileScreenViewController.swift
//  BostaTask
//
//  Created by name on 14/09/2025.
//

import Combine
import UIKit

class ProfileScreenViewController: UIViewController {
  private let headerView = NameAndAddressView(
    name: "John Doe",
    address: "123 Main Street Main Street, Cairo city, 12294005122112121212"
  )
  private let albumsTableView = AlbumsTableView()

  private let viewModel = ProfileScreenViewModel()
  private var cancellables = Set<AnyCancellable>()

  private let spinner = UIActivityIndicatorView(style: .large)

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    addUICompoents()
    bindViewModel()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    viewModel.fetchAlbums()
  }

  private func setupView() {
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.title = "Porfile"
    view.backgroundColor = .systemBackground
  }

  private func addUICompoents() {
    view.addSubviews(headerView, albumsTableView, spinner)
    
    headerView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                      leading: view.leadingAnchor,
                      trailing: view.trailingAnchor,
                      padding: .init(top: 16, left: 16, bottom: 0, right: 16),
                      size: .init(width: 0, height: 80))

    albumsTableView.anchor(top: headerView.bottomAnchor,
                           leading: view.leadingAnchor,
                           trailing: view.trailingAnchor,
                           bottom: view.bottomAnchor)
        
    spinner.center = view.center
  }

  private func bindViewModel() {
    viewModel.$albums
      .receive(on: DispatchQueue.main)
      .sink { [weak self] model in
        guard let self = self else { return }
        self.albumsTableView.update(with: model)
      }
      .store(in: &cancellables)

    viewModel.$isLoading
      .receive(on: DispatchQueue.main)
      .sink { [weak self] loading in
        guard let self = self else { return }
        if loading {
          self.spinner.startAnimating()
        } else {
          self.spinner.stopAnimating()
        }
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
