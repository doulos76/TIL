//
//  BadCodeController.swift
//  NetworkingGeneraicPractice
//
//  Created by dave76 on 08/04/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

class BadCodeController: UITableViewController {
  
  var isLoadingData = false
  let loaderView = UIActivityIndicatorView(style: .whiteLarge)
  var homeFeed: HomeFeed?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // 1. put the UI in loading state
    // 2. fetch the data from server of some kind
    // 3. put the UI in finished loading state and refresh UI
    
    isLoadingData = true
    loaderView.startAnimating()
    homeFeed = nil
    tableView.reloadData()
    
    let urlString = "https://api.letsbuildthatapp.com/youtube/home_feed"
    guard let url = URL(string: urlString) else { return }
    URLSession.shared.dataTask(with: url) { (data, _, err) in
      if let err = err {
        print("Failed to fetch home feed:", err)
        return
      }
      
      guard let data = data else { return }
      do {
        let homeFeed = try JSONDecoder().decode(HomeFeed.self, from: data)
        self.homeFeed = homeFeed
        self.isLoadingData = false
        self.loaderView.stopAnimating()
        self.tableView.reloadData()
      } catch let jsonErr {
        print("Failed to serialize json:", jsonErr)
      }
    }.resume()
  }
}
