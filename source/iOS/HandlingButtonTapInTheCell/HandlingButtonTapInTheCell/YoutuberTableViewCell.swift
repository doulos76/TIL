//
//  YoutuberTableViewCell.swift
//  HandlingButtonTapInTheCell
//
//  Created by dave76 on 05/04/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

class YoutuberTableViewCell: UITableViewCell {
  
  var youtuber: String?
  
  let youtuberLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let subscribeButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Subscribe", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  var subscribeButtonAction: (() -> ())?
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupUI()
    self.subscribeButton.addTarget(self, action: #selector(subscribeButtonTapped(_:)), for: .touchUpInside)
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  @objc func subscribeButtonTapped(_ sender: UIButton) {
    subscribeButtonAction?()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  fileprivate func setupUI() {
    addSubview(youtuberLabel)
    addSubview(subscribeButton)
    youtuberLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
    youtuberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
    youtuberLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    youtuberLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    subscribeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
    subscribeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    subscribeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
  }
  
}
