//
//  GenderCell.swift
//  UserInformationSetting
//
//  Created by dave76 on 04/04/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

class GenderCell: BasicCell {
  
  var genderSegmentedControl: UISegmentedControl = {
    let items = ["남", "여"]
    let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
    segmentedControl.setTitle("남", forSegmentAt: 0)
    segmentedControl.setTitle("여", forSegmentAt: 1)
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    return segmentedControl
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupUI()
  }
  
  fileprivate func setupUI() {
    titleLabel.text = "성별"
    addSubview(genderSegmentedControl)
    genderSegmentedControl.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    genderSegmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    genderSegmentedControl.widthAnchor.constraint(equalToConstant: 100).isActive = true
    genderSegmentedControl.heightAnchor.constraint(equalToConstant: 20).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
