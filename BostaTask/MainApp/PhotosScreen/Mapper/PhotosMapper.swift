//
//  PhotosMapper.swift
//  BostaTask
//
//  Created by name on 15/09/2025.
//

import Foundation

struct PhotosMapper {
  static func mapPhotoss(_ photos: [PhotoEntity]) -> [Photo] {
    return photos.map { photo in
      Photo(id: photo.id, title: photo.title, url: photo.url, thumbnailUrl: photo.thumbnailUrl)
    }
  }
}
