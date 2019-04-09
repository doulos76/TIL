//
//  ViewController.swift
//  MakeAPhone
//
//  Created by dave76 on 09/04/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func phoneNumberTouched(_ sender: UIButton) {
    let myPhoneNumber = "010-1234-5678"
    if let phoneCallURL = URL(string: "tel://\(myPhoneNumber)") {
      let application: UIApplication = UIApplication.shared
      if (application.canOpenURL(phoneCallURL)) {
        application.open(phoneCallURL, options: [:], completionHandler: nil)
      }
    }
  }
}

