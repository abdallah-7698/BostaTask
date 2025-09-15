//
//  PhotosScreenFactory.swift
//  BostaTask
//
//  Created by name on 15/09/2025.
//

import UIKit

struct PhotosScreenFactory {
  static func makeViewContrller(albom: AlbumsTableViewCellDataModle) -> PhotosScreenViewController {
    let photoViewModel = PhotosScreenViewModel(album: albom)
    return PhotosScreenViewController(viewModel: photoViewModel)
  }
}
