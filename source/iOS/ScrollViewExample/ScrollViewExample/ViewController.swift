//
//  ViewController.swift
//  ScrollViewExample
//
//  Created by dave76 on 09/04/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  lazy var scrollView: UIScrollView = {
    let view = UIScrollView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.contentSize.height = 2000
    view.backgroundColor = .brown
    return view
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(scrollView)
    setupScrollView()
  }

  fileprivate func setupScrollView() {
    scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    
    let firstLabel = UILabel()
    firstLabel.translatesAutoresizingMaskIntoConstraints = false
    firstLabel.textColor = .white
    firstLabel.text = "Top of our ScrollView"
    
    scrollView.addSubview(firstLabel)
    firstLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
    firstLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
    firstLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
    firstLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    let secondLabel = UILabel()
    secondLabel.translatesAutoresizingMaskIntoConstraints = false
    secondLabel.textColor = .white
    secondLabel.text = "Bottom of our ScrollView"
    
    scrollView.addSubview(secondLabel)
    secondLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
    secondLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 1900).isActive = true
    secondLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
    secondLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

  }

}

