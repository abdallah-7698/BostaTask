//
//  UIView+EX.swift
//  BostaTask
//
//  Created by name on 14/09/2025.
//

import SwiftUI
import UIKit

extension UIView {
  // MARK: - Add SubViews

  func addSubviews(_ views: UIView...) {
    views.forEach { addSubview($0) }
  }
  
  // MARK: - Add Constraints To View

  func anchor(
    top: NSLayoutYAxisAnchor? = nil,
    leading: NSLayoutXAxisAnchor? = nil,
    trailing: NSLayoutXAxisAnchor? = nil,
    bottom: NSLayoutYAxisAnchor? = nil,
    padding: UIEdgeInsets = .zero,
    size: CGSize = .zero
  ) {
    translatesAutoresizingMaskIntoConstraints = false
    var anchors: [NSLayoutConstraint] = []
    
    if let top = top {
      anchors.append(topAnchor.constraint(equalTo: top, constant: padding.top))
    }

    if let leading = leading {
      anchors.append(leadingAnchor.constraint(equalTo: leading, constant: padding.left))
    }
    
    if let bottom = bottom {
      anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom))
    }
    
    if let trailing = trailing {
      anchors.append(trailingAnchor.constraint(equalTo: trailing, constant: -padding.right))
    }
    
    if size.height != 0 {
      anchors.append(heightAnchor.constraint(equalToConstant: size.height))
    }
    
    if size.width != 0 {
      anchors.append(widthAnchor.constraint(equalToConstant: size.width))
    }
    
    NSLayoutConstraint.activate(anchors)
  }
  
  func centerInSuperview(size: CGSize = .zero) {
    translatesAutoresizingMaskIntoConstraints = false
    if let superviewCenterXAnchor = superview?.centerXAnchor {
      centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
    }
    
    if let superviewCenterYAnchor = superview?.centerYAnchor {
      centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
    }
    
    if size.height != 0 {
      widthAnchor.constraint(equalToConstant: size.height).isActive = true
    }
    
    if size.width != 0 {
      widthAnchor.constraint(equalToConstant: size.width).isActive = true
    }
  }
}

extension UIView {
  @available(iOS 13, *)
  private struct Preview: UIViewRepresentable {
    typealias UIViewType = UIView
    let view: UIView
    func makeUIView(context: Context) -> UIView {
      return self.view
    }
        
    func updateUIView(_ uiView: UIView, context: Context) {}
  }
    
  @available(iOS 13, *)
  func showPreview() -> some View {
    Preview(view: self)
  }
}

extension UIView {
  func showLoading(_ show: Bool) {
    let tag = 999
    if show {
      if self.viewWithTag(tag) != nil { return }
              
      let loadingView = LoadingView()
      loadingView.tag = tag
      addSubview(loadingView)
      loadingView.anchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, bottom: bottomAnchor)
    } else {
      self.viewWithTag(tag)?.removeFromSuperview()
    }
  }
}

// remove this and add onCancel logic not make it remove the it from

extension UIView {
  func showErrorView(message: String? = nil, onRetry: (() -> Void)? = nil) {
    let show = message != nil
    let tag = 888
    if show {
      // Remove existing error view if any
      self.viewWithTag(tag)?.removeFromSuperview()
              
      let overlay = ErrorView(frame: bounds)
      overlay.tag = tag
      overlay.messageLabel.text = message
      overlay.onRetry = onRetry
      overlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
              
      addSubview(overlay)
    } else {
      // Hide/remove error view
      self.viewWithTag(tag)?.removeFromSuperview()
    }
  }
}
