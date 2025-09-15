//
//  ViewController+Ex.swift
//  BostaTask
//
//  Created by name on 14/09/2025.
//

import UIKit
import SwiftUI

extension UIViewController {
    @available(iOS 13, *)
    private struct Preview: UIViewControllerRepresentable {
        // this variable is used for injecting the current view controller
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    }
    
    @available(iOS 13, *)
    func showPreview() -> some View {
        Preview(viewController: self)
    }
}

extension UIViewController {
    func showErrorAlert(title: String = "Error",
                        message: String,
                        buttonTitle: String = "OK",
                        completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: buttonTitle, style: .default) { _ in
            completion?()
        }
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
