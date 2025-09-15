//
//  LoadingView.swift
//  BostaTask
//
//  Created by name on 15/09/2025.
//

import UIKit

class LoadingView: UIView {
  private let spinner: UIActivityIndicatorView = {
    let spinner = UIActivityIndicatorView(style: .large)
    spinner.translatesAutoresizingMaskIntoConstraints = false
    spinner.startAnimating()
    return spinner
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView() {
    backgroundColor = UIColor.black.withAlphaComponent(0.2)
    addSubview(spinner)
    anchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, bottom: bottomAnchor)
    spinner.centerInSuperview()
  }
}
