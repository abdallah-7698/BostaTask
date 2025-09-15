//
//  AlbumsMapper.swift
//  BostaTask
//
//  Created by name on 15/09/2025.
//
import Foundation

struct AlbumsMapper {
  static func mapAlbums(_ albums: [AlbumEntity]) -> [AlbumsTableViewCellDataModle] {
    return albums.map { album in
      AlbumsTableViewCellDataModle(
        id: album.id,
        title: album.title,
      )
    }
  }
}
