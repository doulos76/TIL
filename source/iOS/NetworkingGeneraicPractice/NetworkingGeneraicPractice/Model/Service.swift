//
//  Service.swift
//  NetworkingGeneraicPractice
//
//  Created by dave76 on 08/04/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import Foundation

struct Service {
  static let shared = Service()
  
  func fetchGenericData<T: Decodable>(urlString: String, completion: @escaping (T) -> ()) {
    guard let url = URL(string: urlString) else { return }
    URLSession.shared.dataTask(with: url) { (data, _, err) in
      if let err = err {
        print("Failed to fetch home feed:", err)
        return
      }
      
      guard let data = data else { return }
      do {
        let homeFeed = try JSONDecoder().decode(T.self, from: data)
        DispatchQueue.main.async {
          completion(homeFeed)
        }
      } catch let jsonErr {
        print("Failed to serialize json:", jsonErr)
      }
      }.resume()
  }
}
