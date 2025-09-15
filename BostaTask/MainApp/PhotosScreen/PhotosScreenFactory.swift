//
//  PhotosScreenFactory.swift
//  BostaTask
//
//  Created by name on 15/09/2025.
//

import UIKit

struct PhotosScreenFactory {
  static func makeViewContrller(album: AlbumsTableViewCellDataModle) -> PhotosScreenViewController {
    let photoViewModel = PhotosScreenViewModel(album: album)
    return PhotosScreenViewController(viewModel: photoViewModel)
  }
}
