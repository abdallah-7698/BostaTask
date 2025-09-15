//
//  PhotosCollectionView.swift
//  BostaTask
//
//  Created by name on 15/09/2025.
//
import UIKit

class PhotosCollectionView: UICollectionView {
  enum Section: CaseIterable {
    case photos
  }
    
  private var diffableDataSource: UICollectionViewDiffableDataSource<Section, Photo>!
  private var photos: [Photo] = []
  
  var onSelectPhoto: ((Photo) -> Void) = { _ in }

  convenience init() {
    self.init(frame: .zero, collectionViewLayout: UICollectionViewLayout.createSquareCellLayout())
    setupCollectionView()
    setupDataSource()
  }
    
  private func setupCollectionView() {
    backgroundColor = .systemBackground
    delegate = self
    register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.reuseIdentifier)
  }
    
  private func setupDataSource() {
    diffableDataSource = UICollectionViewDiffableDataSource<Section, Photo>(
      collectionView: self
    ) { [weak self] collectionView, indexPath, photo in
      self?.configureCell(in: collectionView, at: indexPath, with: photo) ?? UICollectionViewCell()
    }
  }
  
  private func configureCell(
    in collectionView: UICollectionView,
    at indexPath: IndexPath,
    with photo: Photo
  ) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: PhotoCell.reuseIdentifier,
      for: indexPath
    ) as? PhotoCell else {
      assertionFailure("Failed to dequeue PhotoCell")
      return UICollectionViewCell()
    }
      
    let imageUrl = "https://picsum.photos/300/300?random=\(photo.id)"
    cell.setImage(from: imageUrl)
      
    #if DEBUG
    if photo.thumbnailUrl.isEmpty {
      print("⚠️ Can not load the Image from this URL: \(photo.thumbnailUrl.isEmpty)")
    }
    #endif
      
    return cell
  }
  
  func updatePhotos(_ newPhotos: [Photo]) {
    photos = newPhotos
    applySnapshot(photos: photos)
  }
    
  private func applySnapshot(photos: [Photo]) {
    var snapshot = NSDiffableDataSourceSnapshot<Section, Photo>()
    snapshot.appendSections([.photos])
    snapshot.appendItems(photos, toSection: .photos)
    diffableDataSource.apply(snapshot, animatingDifferences: true)

  }
}

extension PhotosCollectionView: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let photo = diffableDataSource.itemIdentifier(for: indexPath) else { return }
    onSelectPhoto(photo)
  }
}


#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct PhotosCollectionView_Preview: PreviewProvider {
  static var previews: some View {
    PhotosCollectionView()
      .showPreview()
  }
}
#endif
