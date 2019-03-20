//
//  ViewController.swift
//  URLSessionParsingTest
//
//  Created by dave76 on 19/03/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var detailByIdOils = [DetailByIdOil]()
  let detailByIdApi = DetailByIdApi()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    let uniId = "A0016244"
//    detailByIdApi.detailById(uniId: uniId) { (detailById) in
//      print("test")
//    }
    detailByIdApi.detailById(uniId: uniId)
  }


}

