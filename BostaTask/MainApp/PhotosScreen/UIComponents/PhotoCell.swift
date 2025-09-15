//
//  PhotoCell.swift
//  BostaTask
//
//  Created by name on 15/09/2025.
//
import Kingfisher
import UIKit

class PhotoCell: UICollectionViewCell {
  let imageView: UIImageView = {
    let im = UIImageView()
    im.contentMode = .scaleAspectFill
    im.clipsToBounds = true
    im.tintColor = .lightGray
    im.layer.cornerRadius = 10
    return im
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.addSubview(imageView)

    imageView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, bottom: contentView.bottomAnchor)
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setImage(from urlString: String, placeholder: UIImage? = UIImage(systemName: "photo")) {
    guard let url = URL(string: urlString) else {
      imageView.image = placeholder
      return
    }

    imageView.kf.setImage(
            with: url,
            placeholder: placeholder,
            options: [
                .transition(.fade(0.3)),
                .cacheOriginalImage
            ],
            completionHandler: { result in
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

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct PhotosCell_Preview: PreviewProvider {
  static var previews: some View {
    PhotoCell()
      .showPreview()
      .padding(.horizontal, 100)
      .padding(.vertical, 300)
  }
}
#endif
