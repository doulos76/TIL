//
//  ViewController.swift
//  HandlingButtonTapInTheCell
//
//  Created by dave76 on 05/04/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
  
  let youtubers = ["Brian Voong", "Seth Everman", "Dave Lee", "Cybershell", "Bill Wurtz"]
  let cellReuseIdentifier = "cellReuseIdentifier"

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    tableView.register(YoutuberTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return youtubers.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! YoutuberTableViewCell
    cell.youtuberLabel.text = youtubers[indexPath.row]
    
    // assign the index of the youtuber to button tag
    cell.subscribeButton.tag = indexPath.row
    
    // call the subscribeTapped method when tapped
    cell.subscribeButton.addTarget(self, action: #selector(subscribeTapped(_:)), for: .touchUpInside)
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
  
  @objc func subscribeTapped(_ sender: UIButton){
    // use the tag of button as index
    let youtuber = youtubers[sender.tag]
    let alert = UIAlertController(title: "Subscribed!", message: "Subscribed to \(youtuber)", preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alert.addAction(okAction)
    
    self.present(alert, animated: true, completion: nil)
  }
  
}

