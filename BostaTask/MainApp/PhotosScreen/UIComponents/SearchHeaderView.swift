//
//  SearchHeaderView.swift
//  BostaTask
//
//  Created by name on 15/09/2025.
//

import UIKit

class SearchHeaderView: UIView {
  var onSearchTextChanged: ((String) -> Void)?

  private let searchBar: UISearchBar = {
    let sb = UISearchBar()
    sb.placeholder = "Search photos..."
    sb.searchBarStyle = .minimal
    if let textField = sb.value(forKey: "searchField") as? UITextField {
      textField.font = UIFont.systemFont(ofSize: 17, weight: .medium)
    }
    return sb
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupUI()
  }

  private func setupUI() {
    addSubview(searchBar)
    searchBar.anchor(top: topAnchor,
                     leading: leadingAnchor,
                     trailing: trailingAnchor,
                     bottom: bottomAnchor)
    searchBar.delegate = self
    backgroundColor = .systemBackground
  }
}

extension SearchHeaderView: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    onSearchTextChanged?(searchText)
  }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct SearchHeaderView_Preview: PreviewProvider {
  static var previews: some View {
    SearchHeaderView()
      .showPreview()
  }
}
#endif
