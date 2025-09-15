//
//  ErrorView.swift
//  BostaTask
//
//  Created by name on 15/09/2025.
//
import UIKit

class ErrorView: UIView {
  var onRetry: (() -> Void)?
    
  private let containerView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemBackground
    view.layer.cornerRadius = 16
    view.layer.shadowColor = UIColor.black.cgColor
    view.layer.shadowOpacity = 0.2
    view.layer.shadowRadius = 8
    view.layer.shadowOffset = CGSize(width: 0, height: 4)
    return view
  }()
    
  private let iconImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(systemName: "exclamationmark.triangle.fill")
    imageView.tintColor = .systemRed
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
    
  let messageLabel: UILabel = {
    let label = UILabel()
    label.text = "Something went wrong"
    label.font = .systemFont(ofSize: 20, weight: .semibold)
    label.textColor = .label
    label.textAlignment = .center
    label.numberOfLines = 0
    return label
  }()
    
  private let buttonsStack: UIStackView = {
    let stack = UIStackView()
    stack.axis = .horizontal
    stack.spacing = 16
    stack.distribution = .fillEqually
    return stack
  }()
  
  private let retryButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Retry", for: .normal)
    button.backgroundColor = .systemBlue
    button.tintColor = .white
    button.layer.cornerRadius = 12
    button.titleLabel?.font = .boldSystemFont(ofSize: 18)
    return button
  }()
    
  private let cancelButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Cancel", for: .normal)
    button.backgroundColor = .systemGray
    button.tintColor = .white
    button.layer.cornerRadius = 12
    button.titleLabel?.font = .boldSystemFont(ofSize: 18)
    return button
  }()
    
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
    setupLayout()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView() {
    backgroundColor = UIColor.black.withAlphaComponent(0.2)
        
    addSubview(containerView)
    buttonsStack.addArrangedSubview(retryButton)
    buttonsStack.addArrangedSubview(cancelButton)
    containerView.addSubviews(iconImageView, messageLabel, buttonsStack)
      
    retryButton.addTarget(self, action: #selector(retryTapped), for: .touchUpInside)
    cancelButton.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
  }
    
  private func setupLayout() {
    containerView.anchor(
      top: nil,
      leading: leadingAnchor,
      trailing: trailingAnchor,
      bottom: nil,
      padding: .horizontal(32)
    )
    containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

    iconImageView.anchor(
      top: containerView.topAnchor,
      leading: nil,
      trailing: nil,
      bottom: nil,
      padding: .top(32),
      size: CGSize(width: 60, height: 60)
    )
    iconImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true

    messageLabel.anchor(
      top: iconImageView.bottomAnchor,
      leading: containerView.leadingAnchor,
      trailing: containerView.trailingAnchor,
      padding: UIEdgeInsets(top: 24, left: 16, bottom: 24, right: 16)
    )

    buttonsStack.anchor(
      top: messageLabel.bottomAnchor,
      leading: containerView.leadingAnchor,
      trailing: containerView.trailingAnchor,
      bottom: containerView.bottomAnchor,
      padding: .all(32),
      size: CGSize(width: 0, height: 44)
    )
  }
    
  @objc private func retryTapped() {
    removeFromSuperview()
    onRetry?()
  }
    
  @objc private func cancelTapped() {
    removeFromSuperview()
  }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ErrorView_Preview: PreviewProvider {
  static var previews: some View {
    ErrorView().showPreview()
  }
}
#endif
