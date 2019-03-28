//
//  BaseTableViewController.swift
//  TableSearch
//
//  Created by dave76 on 28/03/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {
  
  // MARK:- Properties
  var filteredProducts = [Product]()
  private var numberFormatter = NumberFormatter()
  
  // MARK:- Constants
  
  static let tableViewCellIdentifier = "cellID"
  private static let nibName = "TableCell"
  
  // MARK:- View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    numberFormatter.numberStyle = .currency
    numberFormatter.formatterBehavior = .default
    
    let nib = UINib(nibName: BaseTableViewController.nibName, bundle: nil)
    
    tableView.register(nib, forCellReuseIdentifier: BaseTableViewController.tableViewCellIdentifier)
  }
  
  // MARK:- Configuration
  func configureCell(_ cell: UITableViewCell, forProduct product: Product) {
    cell.textLabel?.text = product.title
    let priceString = numberFormatter.string(from: NSNumber(value: product.introPrice))
    cell.detailTextLabel?.text = "\(priceString!) | \(product.yearIntroduced)"
  }
  
}
