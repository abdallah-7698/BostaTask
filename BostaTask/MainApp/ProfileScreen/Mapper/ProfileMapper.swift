//
//  ProfileMapper.swift
//  BostaTask
//
//  Created by name on 15/09/2025.
//
import Foundation

struct ProfileMapper {
  static func mapProfile(_ user: UserEntity) -> ProfileHeaderViewModel {
    return ProfileHeaderViewModel(
      id: user.id,
      name: user.name,
      address: "\(user.address.city), \(user.address.street), \(user.address.zipcode)"
    )
  }
}
