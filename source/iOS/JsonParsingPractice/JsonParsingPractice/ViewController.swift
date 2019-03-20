//
//  ViewController.swift
//  JsonParsingPractice
//
//  Created by dave76 on 20/03/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

struct ToDo {
  let userId: Int
  let title: String
  let completed: String
  
  init(json: [String: Any]) {
    userId = json["userId"] as? Int ?? -1
    title = json["title"] as? String ?? ""
    completed = json["completed"] as? String ?? ""
  }
  
}

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
//    fetchData()
    fetchDataUsingJSONSerialization()
  }
  
  func fetchData() {
    let urlString = "https://jsonplaceholder.typicode.com/todos"
    guard let url = URL(string: urlString) else { return }
    
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      
      guard let dataResponse = data, error == nil else {
        print(error?.localizedDescription ?? "Response Error")
        return
      }
      
      do {
        let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: [])
        print(jsonResponse)
      } catch let parsingError {
        print("Error", parsingError)
      }
    }.resume()
  }
}

func fetchDataUsingJSONSerialization() {
  let urlString = "https://jsonplaceholder.typicode.com/todos"
  guard let url = URL(string: urlString) else { return }
  URLSession.shared.dataTask(with: url) { (data, response, error) in
    guard error == nil else {
      print(error?.localizedDescription)
      return
    }
    
    guard let data = data else { return }
    
    //let dataAsString = String(data: data, encoding: .utf8)
    //print(dataAsString!)
    
    do {
      let json = try JSONSerialization.jsonObject(with: data, options: [])
      print(json)
    } catch let jsonError {
      print(jsonError.localizedDescription)
    }
    
    
  }.resume()
}
