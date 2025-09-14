//
//  NameAndAddressView.swift
//  BostaTask
//
//  Created by name on 14/09/2025.
//

import UIKit

class NameAndAddressView: UIView {
  private let nameLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    label.textColor = .label
    label.numberOfLines = 1
    return label
  }()
      
  private let addressLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 16)
    label.textColor = .label
    label.numberOfLines = 0
    return label
  }()
  
  convenience init(name: String, address: String) {
    self.init(frame: .zero)
    setupUI()
    configure(name: name, address: address)
  }
  
  private func setupUI() {
    addSubview(nameLabel)
    addSubview(addressLabel)
            
    nameLabel.anchor(
      top: topAnchor,
      leading: leadingAnchor,
      trailing: trailingAnchor
    )
            
    addressLabel.anchor(
      top: nameLabel.bottomAnchor,
      leading: leadingAnchor,
      trailing: trailingAnchor,
      padding: .top(10)
    )
  }
  
  func configure(name: String, address: String) {
    nameLabel.text = name
    addressLabel.text = address
  }
}
