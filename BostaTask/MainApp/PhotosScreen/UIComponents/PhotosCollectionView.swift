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
    
  convenience init() {
    self.init(frame: .zero, collectionViewLayout: UICollectionViewLayout.createSquareCellLayout())
    setupCollectionView()
    setupDataSource()
  }
    
  private func setupCollectionView() {
    backgroundColor = .systemBackground
    register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.reuseIdentifier)
  }
    
  private func setupDataSource() {
    diffableDataSource = UICollectionViewDiffableDataSource<Section, Photo>(collectionView: self) { [weak self] collectionView, indexPath, _ in
      guard let self = self else { return UICollectionViewCell() }

      let photo = self.photos[indexPath.row]

      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseIdentifier, for: indexPath) as! PhotoCell
      
      print(" Error -> This Image Does not works \(photo.thumbnailUrl)")
      
      cell.setImage(from: "https://picsum.photos/300/300?random=\(photo.id)")
      return cell
    }
  }
    
  func updatePhotos(_ newPhotos: [Photo]) {
    photos = newPhotos
    applySnapshot(photos: photos)
  }
    
  private func applySnapshot(photos: [Photo]) {
    var snapshot = NSDiffableDataSourceSnapshot<Section, Photo>()
    snapshot.appendSections(Section.allCases)
    snapshot.appendItems(photos, toSection: .photos)
    diffableDataSource.apply(snapshot, animatingDifferences: true)
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
