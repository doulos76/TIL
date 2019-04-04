//
//  ViewController.swift
//  PlistExample
//
//  Created by dave76 on 04/04/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    readPlsit()
    writePlist()
    printPlist()
  }
  
  fileprivate func writePlist() {
    let plist = UserDefaults.standard
    
    plist.set("홍진영", forKey: "이름")
    plist.set(24, forKey: "나이")
    plist.set("남", forKey: "성별")
    
    plist.synchronize()
  }
  
  fileprivate func readPlsit() {
    let plist = UserDefaults.standard
    let name = plist.string(forKey: "이름")
    let age = plist.integer(forKey: "나이")
    let sex = plist.object(forKey: "성별") as? NSString
  }
  
  fileprivate func printPlist() {
    readPlsit()
    let plist = UserDefaults.standard
    print(plist.string(forKey: "이름"))
  }

}

