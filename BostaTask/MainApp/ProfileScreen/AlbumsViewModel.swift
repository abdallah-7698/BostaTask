//
//  AlbumsViewModel.swift
//  BostaTask
//
//  Created by name on 15/09/2025.
//
import Combine

class ProfileScreenViewModel {
  @Published var albums: [AlbumsTableViewCellDataModle] = []
  @Published var isLoading: Bool = false
  @Published var error: String?
  
  func fetchAlbums() {
    albums = [
      .init(title: "Title 1"),
      .init(title: "Title 2"),
      .init(title: "Title 3")
    ]
  }
  
}
