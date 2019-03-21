//
//  ViewController.swift
//  UserDefaultsExample
//
//  Created by dave76 on 21/03/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let defaults = UserDefaults.standard
  
  let bluetoothLabel: UILabel = {
    let label = UILabel()
    label.text = "Bluetooth"
    label.font = .systemFont(ofSize: 18)
    label.textColor = .black
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let bluetoothSelectSwitch: UISwitch = {
    let selectSwitch = UISwitch()
    selectSwitch.isOn = false
    selectSwitch.translatesAutoresizingMaskIntoConstraints = false
    selectSwitch.addTarget(self, action: #selector(handleSaveSwitchState), for: .valueChanged)
    return selectSwitch
  }()
  
  lazy var stackView: UIStackView = {
    let arrangedSubviews = [bluetoothLabel, bluetoothSelectSwitch]
    let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  

  override func viewDidLoad() {
    super.viewDidLoad()
    
    if defaults.object(forKey: "SwitchState") != nil {
      bluetoothSelectSwitch.isOn = defaults.bool(forKey: "SwitchState")
    }
    
    setupViews()
  }
  
  @objc func handleSaveSwitchState() {
    
    if bluetoothSelectSwitch.isOn {
      defaults.set(true, forKey: "SwitchState")
    } else {
      defaults.set(false, forKey: "SwitchState")
    }
  }
  
  fileprivate func setupViews() {
    view.addSubview(stackView)
    stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    stackView.heightAnchor.constraint(equalToConstant: 20).isActive = true
  }


}

