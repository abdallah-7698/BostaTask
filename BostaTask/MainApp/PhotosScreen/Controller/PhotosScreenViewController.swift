//
//  PhotosScreenViewController.swift
//  BostaTask
//
//  Created by name on 15/09/2025.
//
import UIKit
import Combine

class PhotosScreenViewController: UIViewController {
  
  private var photosCollectionView = PhotosCollectionView()
  private let searchView = SearchHeaderView()
  
  private var viewModel: PhotosScreenViewModel
  private var cancellables = Set<AnyCancellable>()

  init(viewModel: PhotosScreenViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    addUIComponents()
    bindViewModel()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    viewModel.fetchgetPhotosData()
  }
  
  private func setupView() {
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.title = viewModel.album.title
    view.backgroundColor = .systemBackground
  }
  
  private func addUIComponents() {
    view.addSubviews(searchView, photosCollectionView)
    
    searchView.anchor(
      top: view.safeAreaLayoutGuide.topAnchor,
      leading: view.leadingAnchor,
      trailing: view.trailingAnchor)
    
    photosCollectionView.anchor(
            top: searchView.bottomAnchor,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            bottom: view.bottomAnchor
        )
  }
  
  private func bindViewModel() {
    searchView.onSearchTextChanged = { [weak self] searchText in
      guard let self = self else { return }
      viewModel.onSearchTextChanged(searchText)
    }
    
    photosCollectionView.onSelectPhoto = { [weak self] photo in
      guard let self = self else { return }
      let photoDetailsViewController = PhotoDetailViewController(photo: photo)
      self.present(photoDetailsViewController, animated: false)
    }
    
    viewModel.$photosData
      .sink { [weak self] photosData in
        guard let self = self else { return }
        self.photosCollectionView.updatePhotos(photosData)
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
          self.viewModel.fetchgetPhotosData()
        })
      }
      .store(in: &cancellables)
  }
  
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct PhotosScreenViewController_Preview: PreviewProvider {
  static var previews: some View {
    UINavigationController(rootViewController: PhotosScreenViewController(viewModel: .init(album: AlbumsTableViewCellDataModle(id: 0, title: "Any Title"))))
      .showPreview()
  }
}
#endif
