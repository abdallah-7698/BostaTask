//
//  AlbumsViewModel.swift
//  BostaTask
//
//  Created by name on 15/09/2025.
//
import Combine
import Foundation

class ProfileScreenViewModel {
  @Published var albums: [AlbumsTableViewCellDataModle] = []
  @Published var profile: ProfileHeaderViewModel = .init(name: "", address: "")
  @Published var isLoading: Bool = false
  @Published var error: String?

  func fetchAlbums() {
         // Start loading
         isLoading = true
         error = nil

         // Simulate a 5-second network delay
         DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
             guard let self = self else { return }
             
             // Stop loading
             self.isLoading = false
             
             // Simulate an error
             self.error = "Failed to load albums."
             
             // If you want to set albums only on success, you can comment the next line
             // self.albums = [
             //     .init(title: "Title 1"),
             //     .init(title: "Title 2"),
             //     .init(title: "Title 3")
             // ]
         }
     }
}
