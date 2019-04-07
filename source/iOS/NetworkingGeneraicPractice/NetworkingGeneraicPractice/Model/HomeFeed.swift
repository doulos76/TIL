//
//  HomeFeed.swift
//  NetworkingGeneraicPractice
//
//  Created by dave76 on 08/04/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import Foundation

struct HomeFeed: Decodable {
  let videos: [Video]
}

struct Video: Decodable {
  let id: Int
  let name: String
  let link: String
  let imageUrl: String
}
