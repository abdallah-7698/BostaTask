//
//  ProfileScreenViewController.swift
//  BostaTask
//
//  Created by name on 14/09/2025.
//

import UIKit

class ProfileScreenViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    let headerView = makeNameAndAddressView()
    view.addSubview(headerView)

    headerView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                      leading: view.leadingAnchor,
                      trailing: view.trailingAnchor,
                      padding: .init(top: 16, left: 16, bottom: 0, right: -16))
  }

  private func setupView() {
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.title = "Porfile"
    view.backgroundColor = .systemBackground
  }

  private func makeNameAndAddressView() -> UIView {
    let container = UIView()

    let nameLabel = UILabel()
    nameLabel.text = "John Doe"
    nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)

    let addressLabel = UILabel()
    addressLabel.text = "123 Main Street, Cairo"
    addressLabel.font = UIFont.systemFont(ofSize: 16)
    addressLabel.textColor = .label
    addressLabel.numberOfLines = 0

    container.addSubview(nameLabel)
    container.addSubview(addressLabel)

    nameLabel.anchor(top: container.topAnchor,
                     leading: container.leadingAnchor,
                     trailing: container.trailingAnchor)

    addressLabel.anchor(
      top: nameLabel.bottomAnchor,
      leading: container.leadingAnchor,
      trailing: container.trailingAnchor,
      padding: .top(4)
    )

    return container
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
