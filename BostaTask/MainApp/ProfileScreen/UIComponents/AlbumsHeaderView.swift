//
//  AlbumsHeaderView.swift
//  BostaTask
//
//  Created by name on 15/09/2025.
//
import UIKit

class AlbumsHeaderView: UITableViewHeaderFooterView {
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
    setupView()
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupView() {
    backgroundColor = .systemBackground
    addSubview(titleLabel)
    titleLabel.anchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, bottom: bottomAnchor, padding: .init(top: 0, left: 16, bottom: 16, right: 16))
  }

  func configure(with title: String) {
    titleLabel.text = title
  }
}
