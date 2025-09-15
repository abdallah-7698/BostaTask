//
//  AlbumsTableViewCell.swift
//  BostaTask
//
//  Created by name on 14/09/2025.
//
import UIKit

class AlbumsTableViewCell: UITableViewCell, ReusableCell{
  typealias Model = AlbumsTableViewCellDataModle
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 16, weight: .medium)
    label.textColor = .label
    return label
  }()
  
  private let lineSeparator: UIView = {
    let view = UIView()
    view.backgroundColor = .separator
    return view
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    selectionStyle = .none
    contentView.addSubviews(lineSeparator, titleLabel)

    lineSeparator.anchor(top: contentView.topAnchor,
                         leading: contentView.leadingAnchor,
                         trailing: contentView.trailingAnchor,
                         padding: .horizontal(16),
                         size: .init(width: 0, height: 1))
    
    titleLabel.anchor(top: contentView.topAnchor,
                      leading: contentView.leadingAnchor,
                      trailing: contentView.trailingAnchor,
                      bottom: contentView.bottomAnchor,
                      padding: .init(top: 5, left: 16, bottom: 5, right: 5))
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(with model: AlbumsTableViewCellDataModle) {
    titleLabel.text = model.title
  }

  func cellInstance(tableView: UITableView, indexPath: IndexPath, model: AlbumsTableViewCellDataModle) -> UITableViewCell  {
    let cell = tableView.dequeueReusableCell(withIdentifier: AlbumsTableViewCell.reuseIdentifier, for: indexPath) as! AlbumsTableViewCell
    cell.backgroundColor = .clear
    cell.configure(with: model)
    return cell
  }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct AlbumsTableViewCell_Preview: PreviewProvider {
  static var previews: some View {
    AlbumsTableViewCell().showPreview()
  }
}
#endif
