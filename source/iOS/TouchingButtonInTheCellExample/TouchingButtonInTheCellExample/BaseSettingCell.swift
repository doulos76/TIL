//
//  BaseSettingCell.swift
//  TouchingButtonInTheCellExample
//
//  Created by dave76 on 05/04/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

class BaseSettingCell: UITableViewCell {
  
  // MARK:- Properites
  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "Title"
    label.textColor = .black
    label.font = .boldSystemFont(ofSize: 14)
    label.textAlignment = .left
    return label
  }()
  
  
  // MARK:- Initializer
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)    
    setupLayout()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK:- Methods
  fileprivate func setupLayout() {
    addSubview(titleLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
    titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    titleLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
  }

}
