//
//  AlbumsViewModel.swift
//  BostaTask
//
//  Created by name on 15/09/2025.
//
import Combine
import Foundation
import Moya

class ProfileScreenViewModel {
  @Published var albums: [AlbumsTableViewCellDataModle] = []
  @Published var profile: ProfileHeaderViewModel = .init(id: 0, name: "", address: "")
  @Published var isLoading: Bool = false
  @Published var error: String?

  // We can change it to Any rundom user id
  private let userId: Int = 1

  private let profileProvider = MoyaProvider<UserProfileRequest>()
  private let albumsProvider = MoyaProvider<UserAlbumsRequest>()
  private var cancellables = Set<AnyCancellable>()

  private(set) var router: ProfileScreenRouter

  init(router: ProfileScreenRouter) {
      self.router = router
  }
  
  func fetchUserData() {
    let profilePublisher = profileProvider
      .requestPublisher(.init(userId: userId))
      .map(\.data)
      .decode(type: UserEntity.self, decoder: JSONDecoder())
      .map { ProfileMapper.mapProfile($0) }

    let albumsPublisher = albumsProvider
      .requestPublisher(.init(userId: userId))
      .map(\.data)
      .decode(type: [AlbumEntity].self, decoder: JSONDecoder())
      .map { AlbumsMapper.mapAlbums($0) }

    Publishers.Zip(profilePublisher, albumsPublisher)
      .assignLoading(to: \.isLoading, on: self)
      .assignError(to: \.error, on: self)
      .receive(on: DispatchQueue.main)
      .sink(
        receiveCompletion: { _ in },
        receiveValue: { [weak self] profile, albums in
          self?.profile = profile
          self?.albums = albums
        }
      )
      .store(in: &cancellables)
  }
}
