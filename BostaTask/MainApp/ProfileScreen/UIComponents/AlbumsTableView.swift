//
//  AlbumsTableView.swift
//  BostaTask
//
//  Created by name on 14/09/2025.
//

import UIKit

class AlbumsTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
  private var items: [AlbumsTableViewCellDataModle] = []
  private let cell = AlbumsTableViewCell()
  
  init() {
    super.init(frame: .zero, style: .plain)
    setupTableView()
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupTableView() {
    delegate = self
    dataSource = self
    rowHeight = 60
    separatorStyle = .singleLine

    let inset: CGFloat = 40
    separatorInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)

    registerCell(AlbumsTableViewCell.self)
  }

  func update(with items: [AlbumsTableViewCellDataModle]) {
    self.items = items
    reloadData()
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    items.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    cell.cellInstance(tableView: tableView, indexPath: indexPath, model: items[indexPath.row])
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    cell.onSelect(indexPath: indexPath)
  }
}
