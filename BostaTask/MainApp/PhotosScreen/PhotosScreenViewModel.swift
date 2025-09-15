//
//  PhotosScreenViewModel.swift
//  BostaTask
//
//  Created by name on 15/09/2025.
//

import Combine
import Foundation
import Moya

class PhotosScreenViewModel {
  @Published var photosData: [Photo] = []

  @Published var isLoading: Bool = false
  @Published var error: String?

  private let photosProvider = MoyaProvider<AlbumPhotosRequest>()
  private var cancellables = Set<AnyCancellable>()

  private var allPhotos: [Photo] = []

  var album: AlbumsTableViewCellDataModle

  init(album: AlbumsTableViewCellDataModle) {
    self.album = album
  }

  func fetchgetPhotosData() {
    photosProvider
      .requestPublisher(.init(albumId: album.id))
      .map(\.data)
      .decode(type: [PhotoEntity].self, decoder: JSONDecoder())
      .map { PhotosMapper.mapPhotoss($0) }
      .assignLoading(to: \.isLoading, on: self)
      .assignError(to: \.error, on: self)
      .receive(on: DispatchQueue.main)
      .sink(
        receiveCompletion: { _ in })
      { [weak self] photos in
        guard let self = self else { return }
        self.allPhotos = photos
        self.photosData = photos
      }
      .store(in: &cancellables)
  }

  func onSearchTextChanged(_ text: String) {
    if text.isEmpty {
      photosData = allPhotos
    } else {
      photosData = allPhotos.filter { $0.title.lowercased().contains(text.lowercased()) }
    }
  }
}
