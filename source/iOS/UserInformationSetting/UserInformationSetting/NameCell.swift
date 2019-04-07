//
//  NameCell.swift
//  UserInformationSetting
//
//  Created by dave76 on 04/04/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

protocol NameCellDelegate: class {
  func nameCellDelegateDidTapUserNameLabel(_ sender: NameCell)
}

class NameCell: BasicCell {
  
  //weak var delegate: NameCellDelegate?
  var
  
  let userNameLabel: UILabel = {
    let label = UILabel()
    label.text = "홍길동"
    label.textColor = .black
    label.font = .systemFont(ofSize: 12)
    label.textAlignment = .right
    label.translatesAutoresizingMaskIntoConstraints = false
    label.isUserInteractionEnabled = true
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)    
    setupUI()
    userNameTouched()
//    self.userNameLabel.addInteraction(<#T##interaction: UIInteraction##UIInteraction#>)
  }
  
  fileprivate func setupUI() {
    addSubview(userNameLabel)
    userNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    userNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    userNameLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
    userNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func userNameTouched() {
    delegate?.nameCellDelegateDidTapUserNameLabel(self)
  }
  
}
