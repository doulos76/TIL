//
//  DetailedCourseController.swift
//  NetworkingGeneraicPractice
//
//  Created by dave76 on 08/04/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

class DetailedCourseController: UITableViewController {
  
  // MARK:- Properties
  let cellId = "cellId"
  var courseDetailes: [CourseDetails]?
  var video: Video! {
    didSet {
      let urlString = "https://api.letsbuildthatapp.com/youtube/course_detail?id=\(video.id)"
      Service.shared.fetchGenericData(urlString: urlString) { (courseDetails: [CourseDetails]) in
        self.courseDetailes = courseDetails
        self.tableView.reloadData()
      }
      navigationItem.title = video.name
    }
  }
  
  // MARK:- View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
  }
  
  // MARK:- Table View DataSource Methods
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return courseDetailes?.count ?? 0
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
    cell.textLabel?.text = courseDetailes?[indexPath.row].name
    return cell
  }
}
