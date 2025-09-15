//
//  Cell+Ex.swift
//  BostaTask
//
//  Created by name on 14/09/2025.
//

import UIKit

protocol ReuseIdentifiable {
  static var reuseIdentifier: String { get }
}

extension ReuseIdentifiable {
  static var reuseIdentifier: String {
    String(describing: self)
  }
}

extension UITableViewCell: ReuseIdentifiable {}
extension UICollectionViewCell: ReuseIdentifiable {}
extension UITableViewHeaderFooterView: ReuseIdentifiable {}

extension UITableView {
  func registerCell<T: UITableViewCell>(_ cellType: T.Type) {
    register(cellType, forCellReuseIdentifier: String(describing: cellType))
  }
  
  func registerHeader<T: UITableViewHeaderFooterView>(_ headerType: T.Type) {
          register(headerType, forHeaderFooterViewReuseIdentifier: String(describing: headerType))
      }
}
