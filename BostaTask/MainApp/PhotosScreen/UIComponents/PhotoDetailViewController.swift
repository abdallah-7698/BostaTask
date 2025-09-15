//
//  PhotoDetailViewController.swift
//  BostaTask
//
//  Created by name on 15/09/2025.
//

import UIKit
import Kingfisher

class PhotoDetailViewController: UIViewController {
  private let photo: Photo
  private let imageView = UIImageView()

  init(photo: Photo) {
    self.photo = photo
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .label.withAlphaComponent(0.6)

    imageView.contentMode = .scaleAspectFit
    view.addSubview(imageView)

    imageView.anchor(top: view.topAnchor, leading: view.leadingAnchor, trailing:  view.trailingAnchor, bottom: view.bottomAnchor)
   
    let imageUrl = "https://picsum.photos/1000/1000?random=\(photo.id)"
    setImage(from: imageUrl)
  }
  
  func setImage(from urlString: String) {
    guard let url = URL(string: urlString) else {
      imageView.image = UIImage(systemName: "photo")
      return
    }

    view.showLoading(true)
    
    imageView.kf.setImage(
            with: url,
            options: [
                .transition(.fade(0.3)),
                .cacheOriginalImage
            ],
            completionHandler: { [weak self] result in
              guard let self else { return }
              self.view.showLoading(false)
                switch result {
                case .success(let value):
                    print("Image loaded successfully: \(value.source.url?.absoluteString ?? "")")
                case .failure(let error):
                    print("Failed to load image: \(error.localizedDescription)")
                }
            }
        )
  }
  
}
