//
//  MarriedCell.swift
//  UserInformationSetting
//
//  Created by dave76 on 04/04/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

protocol MarriedCellDelegate: class {
  func marriedCellDelegateDidTapUserNameLabel(_ sender: MarriedCell)
}


class MarriedCell: BasicCell {
  
  weak var delegate: MarriedCellDelegate?
  
  var marriedSwitch: UISwitch = {
    let sw = UISwitch()
    sw.translatesAutoresizingMaskIntoConstraints = false
    sw.addTarget(self, action: #selector(handleSwitch), for: .valueChanged)
    sw.isOn = false
    return sw
  }()
  
  @objc func handleSwitch(_ sender: UISwitch) {
    print("Switch touched")
    delegate?.marriedCellDelegateDidTapUserNameLabel(self)
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    titleLabel.text = "결혼유무"
    setupUI()
  }
  
  fileprivate func setupUI() {
    addSubview(marriedSwitch)
    marriedSwitch.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    marriedSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
}
