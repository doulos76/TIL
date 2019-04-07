//
//  ViewController.swift
//  TouchingButtonInTheCellExample
//
//  Created by dave76 on 05/04/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

import UIKit

class SettingsController: UIViewController {
  
  let tableView = UITableView()
  
  let settingItems = ["이름", "나이", "성별", "결혼유무"]
  let cellId = "cellId"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    setupLayout()
  }

  // MARK:- Setup Works
  fileprivate func setupTableView() {
    // Do any additional setup after loading the view.
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(SettingCell.self, forCellReuseIdentifier: cellId)
  }
  
  fileprivate func setupLayout() {
    view.addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
  }
}

// MARK:- TableView Datasource, Delegate Methods
extension SettingsController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return settingItems.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SettingCell
    cell.titleLabel.text = settingItems[indexPath.row]
    cell.subscribeButtonAction = { [unowned self] in
      print("\n================[closer way]================\n")
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
}
