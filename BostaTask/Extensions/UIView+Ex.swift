//
//  UIView+EX.swift
//  BostaTask
//
//  Created by name on 14/09/2025.
//

import UIKit

extension UIView {
  func anchor(
    top: NSLayoutYAxisAnchor? = nil,
    leading: NSLayoutXAxisAnchor? = nil,
    bottom: NSLayoutYAxisAnchor? = nil,
    trailing: NSLayoutXAxisAnchor? = nil,
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
}
