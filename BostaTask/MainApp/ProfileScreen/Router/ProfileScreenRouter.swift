//
//  ProfileScreenRouter.swift
//  BostaTask
//
//  Created by name on 15/09/2025.
//

import UIKit

struct ProfileScreenRouter {
  let onSelectAlbum: (_ album: AlbumsTableViewCellDataModle) -> Void
}

extension ProfileScreenRouter {
  static func live(navigationController: UINavigationController?) -> ProfileScreenRouter {
    ProfileScreenRouter { album in
      let vc = PhotosScreenFactory.makeViewContrller(album: album)
      navigationController?.pushViewController(vc, animated: true)
    }
  }
}

