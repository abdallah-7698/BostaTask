//
//  ReusableCell.swift
//  BostaTask
//
//  Created by name on 15/09/2025.
//
import UIKit

protocol ReusableCell: AnyObject {
    associatedtype Model
    func cellInstance(tableView: UITableView, indexPath: IndexPath, model: Model) -> UITableViewCell
}
