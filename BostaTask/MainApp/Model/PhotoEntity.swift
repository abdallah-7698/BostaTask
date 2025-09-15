//
//  PhotoEntity.swift
//  BostaTask
//
//  Created by name on 15/09/2025.
//
import Foundation

struct PhotoEntity: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
