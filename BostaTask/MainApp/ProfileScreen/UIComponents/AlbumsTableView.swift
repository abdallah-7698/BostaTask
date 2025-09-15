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
    separatorStyle = .none

    registerCell(AlbumsTableViewCell.self)
    registerHeader(AlbumsHeaderView.self)
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

  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: AlbumsHeaderView.reuseIdentifier) as! AlbumsHeaderView
    header.configure(with: "My Albums")
    return header
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    UITableView.automaticDimension
  }
}

