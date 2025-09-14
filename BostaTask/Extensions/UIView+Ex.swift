//
//  UIView+EX.swift
//  BostaTask
//
//  Created by name on 14/09/2025.
//

import UIKit
import SwiftUI

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
}

extension UIView {
    @available(iOS 13, *)
    private struct Preview: UIViewRepresentable {
        typealias UIViewType = UIView
        let view: UIView
        func makeUIView(context: Context) -> UIView {
            return view
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {}
    }
    
    @available(iOS 13, *)
    func showPreview() -> some View {
        Preview(view: self)
    }
}
