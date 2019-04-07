//
//  HomeController.swift
//  NetworkingGeneraicPractice
//
//  Created by dave76 on 08/04/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {
  
  // MARK:- Properties
  let cellId = "cellId"
  var isLoadingData = false
  let loaderView = UIActivityIndicatorView(style: .whiteLarge)
  var homeFeed: HomeFeed?
  
  // MARK:- View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    let urlString = "https://api.letsbuildthatapp.com/youtube/home_feed"
    Service.shared.fetchGenericData(urlString: urlString) { (feed: HomeFeed) in
      self.homeFeed = feed
      self.tableView.reloadData()
    }
    
    navigationItem.title = "Courses"
    navigationController?.navigationBar.prefersLargeTitles = true
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
  }
  
  // MARK:- Table View Methods
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return homeFeed?.videos.count ?? 0
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
    cell.textLabel?.text = homeFeed?.videos[indexPath.row].name
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let detailedCourseController = DetailedCourseController()
    detailedCourseController.video = homeFeed?.videos[indexPath.row]
    navigationController?.pushViewController(detailedCourseController, animated: true)
  }
}
