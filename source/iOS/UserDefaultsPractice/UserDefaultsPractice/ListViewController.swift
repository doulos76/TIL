//
//  ListViewController.swift
//  UserDefaultsPractice
//
//  Created by dave76 on 04/04/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
  
  // MARK:- Properties
  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var gender: UISegmentedControl!
  @IBOutlet weak var married: UISwitch!

  // MARK:- View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    let plist = UserDefaults.standard
    name.text = plist.string(forKey: "name")
    married.isOn = plist.bool(forKey: "married")
    gender.selectedSegmentIndex = plist.integer(forKey: "gender")
  }
  
  // MARK:- Methods
  @IBAction func changeGender(_ sender: UISegmentedControl) {
    let value = sender.selectedSegmentIndex
    let plist = UserDefaults.standard
    plist.set(value, forKey: "gender")
    plist.synchronize()
  }
  
  @IBAction func changeMarried(_ sender: UISwitch) {
    let value = sender.isOn
    let plist = UserDefaults.standard
    plist.set(value, forKey: "married")
    plist.synchronize()
  }
  
  
  // MARK:- TableView Datasource
//  override func numberOfSections(in tableView: UITableView) -> Int {
//    return super.numberOfSections(in: tableView)
//  }
  
//  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    return super.tableView(tableView, numberOfRowsInSection: section)
//  }
  
//  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.row == 0 {
      let alert = UIAlertController(title: nil, message: "이름을 입력하세요", preferredStyle: .alert)
      alert.addTextField {
        $0.text = self.name.text
      }
      alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
        let value = alert.textFields?[0].text
        let plist = UserDefaults.standard
        plist.setValue(value, forKey: "name")
        plist.synchronize()
        self.name.text = value
      }))
      self.present(alert, animated: true, completion: nil)
    }
  }
  
}
