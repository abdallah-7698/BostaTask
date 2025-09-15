//
//  UICollectionViewLayout+Ex.swift
//  BostaTask
//
//  Created by name on 15/09/2025.
//
import UIKit

extension UICollectionViewLayout {
  static func createSquareCellLayout() -> UICollectionViewCompositionalLayout {
    let item = NSCollectionLayoutItem.withEntireSize()
    item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

    let group:NSCollectionLayoutGroup!
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(150))
    group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
    
    let section = NSCollectionLayoutSection(group: group)
    
//    let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
//    let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
//    header.pinToVisibleBounds = true
//    section.boundarySupplementaryItems = [header]
    
    return UICollectionViewCompositionalLayout(section: section)
  }
}


extension NSCollectionLayoutItem {
  static func withEntireSize() -> NSCollectionLayoutItem {
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
    return NSCollectionLayoutItem(layoutSize: itemSize)
  }
}

