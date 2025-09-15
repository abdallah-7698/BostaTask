//
//  ProfileScreenRouter.swift
//  BostaTask
//
//  Created by name on 15/09/2025.
//

import UIKit

struct ProfileScreenRouter {
  let onSelecetAlbum: (_ albom: AlbumsTableViewCellDataModle) -> Void
}

extension ProfileScreenRouter {
  static let live = ProfileScreenRouter {albom in
   let vc = PhotosScreenFactory.makeViewContrller(albom: albom)
    // show the new vc
  }
}
