//
//  UserInformationController.swift
//  UserInformationSetting
//
//  Created by dave76 on 04/04/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

class UserInformationController: UITableViewController {
  
  let plist = UserDefaults.standard
  let cellId = "cellId"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationBar()
    tableView.register(BasicCell.self, forCellReuseIdentifier: cellId)
    tableView.register(NameCell.self, forCellReuseIdentifier: cellId)
    tableView.register(GenderCell.self, forCellReuseIdentifier: cellId)
    tableView.register(MarriedCell.self, forCellReuseIdentifier: cellId)
  }
  
  // MARK:- Setup Works
  fileprivate func setupNavigationBar() {
    navigationItem.title = "사용자 정보"
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    var cell = BasicCell(style: .default, reuseIdentifier: cellId)
    //var cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
    switch indexPath.row {
    case 0:
      let cell = NameCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: cellId)
      cell.delegate = self
      return cell
    case 1:
      let cell = GenderCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: cellId)
      
      return cell
    case 2:
      let cell = MarriedCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: cellId)
      cell.delegate = self
      return cell
    default:
      let cell = BasicCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: cellId)
      return cell
    }
  }
  
  override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return UIView()
  }
  
//  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    tableView.deselectRow(at: indexPath, animated: true)
//    if indexPath.row == 0 {
//      let alert = UIAlertController(title: nil, message: "이름을 입력하세요", preferredStyle: .alert)
//      alert.addTextField { (_) in
////        $0.text = "Hello"
//      }
//    }
//  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 50
  }
}

extension UserInformationController: NameCellDelegate {
  func nameCellDelegateDidTapUserNameLabel(_ sender: NameCell) {
    guard let tappedIndexPath = tableView.indexPath(for: sender) else { return }
    print("Name", sender, tappedIndexPath)
    
    let alert = UIAlertController(title: nil, message: "이름을 입력하세요", preferredStyle: .alert)
    alert.addTextField {
      $0.text = sender.userNameLabel.text
    }
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
      let value = alert.textFields?[0].text
      self.plist.set(value, forKey: "name")
      self.plist.synchronize()
    }))
    self.present(alert, animated: true, completion: nil)
  }
}

extension UserInformationController: MarriedCellDelegate {
  func marriedCellDelegateDidTapUserNameLabel(_ sender: MarriedCell) {
    guard let tappedIndexPath = tableView.indexPath(for: sender) else { return }
    print("Married", sender, tappedIndexPath)

  }
  
  
}
