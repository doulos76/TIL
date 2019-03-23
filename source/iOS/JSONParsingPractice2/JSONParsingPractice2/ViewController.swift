//
//  ViewController.swift
//  JSONParsingPractice2
//
//  Created by dave76 on 23/03/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let urlString = "http://www.opinet.co.kr/api/detailById.do?out=json&code=F365181005&id=A0006269"
    guard let url = URL(string: urlString) else { return }
    
    let shared = URLSession.shared
    let task = shared.dataTask(with: url) { (data, response, error) in
      guard let data = data else { return }
      print(String(data: data, encoding: .utf8))
      let decoder = JSONDecoder()
      let detailByIdResult = try? decoder.decode(DetailByID.self, from: data)
      print(detailByIdResult)
    }
    task.resume()
    
    
//    URLSession.shared.detailByIDTask(with: url) { (data, response, error) in
//      guard error == nil else {
//        debugPrint(error?.localizedDescription)
//        return
//      }
//
//      guard let data = data else { return }
//      let dataAsString = String(data: data, encoding: .utf8)
//      print(dataAsString)
//
//    }.resume()
  
//    URLSession.shared.dataTask(with: url) { (data, response, error) in
//      guard error == nil else {
//        debugPrint(error.debugDescription)
//
//        return
//      }
//
//      guard let data = data else { return }
//      let dataAsString = String(data: data, encoding: .utf8)
//      print(dataAsString!)
//
//      let jsonDecoder = JSONDecoder()
//      do {
//        let detailById = try jsonDecoder.decode(DetailByID.self, from: data)
//      } catch {
//        debugPrint(error.localizedDescription)
//      }
////      let detailById = try jsonDecoder.decode(DetailByID.self, from: data)
//      //print(detailById)
//    }.resume()
    
  }
  
}


fileprivate func newJSONDecoder() -> JSONDecoder {
  let decoder = JSONDecoder()
  if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
    decoder.dateDecodingStrategy = .iso8601
  }
  return decoder
}

fileprivate func newJSONEncoder() -> JSONEncoder {
  let encoder = JSONEncoder()
  if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
    encoder.dateEncodingStrategy = .iso8601
  }
  return encoder
}

// MARK: - URLSession response handlers

extension URLSession {
  fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
    return self.dataTask(with: url) { data, response, error in
      guard let data = data, error == nil else {
        completionHandler(nil, response, error)
        return
      }
      completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
    }
  }
  
  func detailByIDTask(with url: URL, completionHandler: @escaping (DetailByID?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
    return self.codableTask(with: url, completionHandler: completionHandler)
  }
}

