//
//  DetailById.swift
//  URLSessionParsingTest
//
//  Created by dave76 on 19/03/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import Foundation

struct DetailById: Decodable {
  let result: DetailByIdResult
  
  enum CodingKeys: String, CodingKey {
    case result = "RESULT"
  }
}

struct DetailByIdResult: Decodable {
  let oil: [DetailByIdOil]
  enum CodingKeys: String, CodingKey {
    case oil = "OIL"
  }
}

struct DetailByIdOil: Decodable {
  let uniId: String
  let pollDivCompany: String //PollDivCompany
  let gpollDivCompany: String //PollDivCompany
  let oilStationName: String
  let vanAddress: String
  let newAddress: String
  let tel: String
  let sigunCode: String
  let lpgYN: String //LpgYN
  let maintenanceYN: String //MaintenanceYN
  let carWashYN: String //CarWashYN
  let kpetroYN: String //KpetroYN
  let cvsYN: String //CvsYN
  let gisXCoordinate: Double
  let gisYCoordinate: Double
  let oilPrices: [DetailByIdOilPrice]
  
  enum CodingKeys: String, CodingKey {
    case uniId = "UNI_ID"
    case pollDivCompany = "POLL_DIV_CO"
    case gpollDivCompany = "GPOLL_DIV_CO"
    case oilStationName = "OS_NM"
    case vanAddress = "VAN_ADR"
    case newAddress = "NEW_ADR"
    case tel = "TEL"
    case sigunCode = "SIGUNCD"
    case lpgYN = "LPG_YN"
    case maintenanceYN = "MAINT_YN"
    case carWashYN = "CAR_WASH_YN"
    case kpetroYN = "KPETRO_YN"
    case cvsYN = "CVS_YN"
    case gisXCoordinate = "GIS_X_COOR"
    case gisYCoordinate = "GIS_Y_COOR"
    case oilPrices = "OIL_PRICE"
  }
}

struct DetailByIdOilPrice: Decodable {
  let productCode: String //ProductCode
  let price: Int
  let tradeDate: String
  let tradeTime: String
  
  enum CodingKeys: String, CodingKey {
    case productCode = "PRODCD"
    case price = "PRICE"
    case tradeDate = "TRADE_DT"
    case tradeTime = "TRADE_TM"
  }
}

enum MaintenanceYN: String, Decodable {
  case y = "Y"
  case n = "N"
}

enum CarWashYN: String, Decodable {
  case y = "Y"
  case n = "N"
}

enum LpgYN: String, Decodable {
  case y = "Y"
  case n = "N"
  case c = "C"
}

enum KpetroYN: String, Decodable {
  case y = "Y"
  case n = "N"
}

enum CvsYN: String, Decodable {
  case y = "Y"
  case n = "N"
}
