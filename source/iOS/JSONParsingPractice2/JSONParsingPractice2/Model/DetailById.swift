//
//  DetailById.swift
//  JSONParsingPractice2
//
//  Created by dave76 on 23/03/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let detailByID = try DetailByID(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.detailByIDTask(with: url) { detailByID, response, error in
//     if let detailByID = detailByID {
//       ...
//     }
//   }
//   task.resume()

import Foundation

struct DetailByID: Codable {
  let result: Result?
  
  enum CodingKeys: String, CodingKey {
    case result = "RESULT"
  }
}

struct Result: Codable {
  let oil: [Oil]?
  
  enum CodingKeys: String, CodingKey {
    case oil = "OIL"
  }
}

struct Oil: Codable {
  let uniID, pollDivCo, gpollDivCo, osNm: String?
  let vanAdr, newAdr, tel, siguncd: String?
  let lpgYn, maintYn, carWashYn, kpetroYn: String?
  let cvsYn: String?
  let gisXCoor, gisYCoor: Double?
  let oilPrice: [OilPrice]?
  
  enum CodingKeys: String, CodingKey {
    case uniID = "UNI_ID"
    case pollDivCo = "POLL_DIV_CO"
    case gpollDivCo = "GPOLL_DIV_CO"
    case osNm = "OS_NM"
    case vanAdr = "VAN_ADR"
    case newAdr = "NEW_ADR"
    case tel = "TEL"
    case siguncd = "SIGUNCD"
    case lpgYn = "LPG_YN"
    case maintYn = "MAINT_YN"
    case carWashYn = "CAR_WASH_YN"
    case kpetroYn = "KPETRO_YN"
    case cvsYn = "CVS_YN"
    case gisXCoor = "GIS_X_COOR"
    case gisYCoor = "GIS_Y_COOR"
    case oilPrice = "OIL_PRICE"
  }
}

struct OilPrice: Codable {
  let prodcd: String?
  let price: Int?
  let tradeDt, tradeTm: String?
  
  enum CodingKeys: String, CodingKey {
    case prodcd = "PRODCD"
    case price = "PRICE"
    case tradeDt = "TRADE_DT"
    case tradeTm = "TRADE_TM"
  }
}

// MARK: Convenience initializers and mutators

extension DetailByID {
  init(data: Data) throws {
    self = try newJSONDecoder().decode(DetailByID.self, from: data)
  }
  
  init(_ json: String, using encoding: String.Encoding = .utf8) throws {
    guard let data = json.data(using: encoding) else {
      throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
    }
    try self.init(data: data)
  }
  
  init(fromURL url: URL) throws {
    try self.init(data: try Data(contentsOf: url))
  }
  
  func with(
    result: Result?? = nil
    ) -> DetailByID {
    return DetailByID(
      result: result ?? self.result
    )
  }
  
  func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }
  
  func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}

extension Result {
  init(data: Data) throws {
    self = try newJSONDecoder().decode(Result.self, from: data)
  }
  
  init(_ json: String, using encoding: String.Encoding = .utf8) throws {
    guard let data = json.data(using: encoding) else {
      throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
    }
    try self.init(data: data)
  }
  
  init(fromURL url: URL) throws {
    try self.init(data: try Data(contentsOf: url))
  }
  
  func with(
    oil: [Oil]?? = nil
    ) -> Result {
    return Result(
      oil: oil ?? self.oil
    )
  }
  
  func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }
  
  func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}

extension Oil {
  init(data: Data) throws {
    self = try newJSONDecoder().decode(Oil.self, from: data)
  }
  
  init(_ json: String, using encoding: String.Encoding = .utf8) throws {
    guard let data = json.data(using: encoding) else {
      throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
    }
    try self.init(data: data)
  }
  
  init(fromURL url: URL) throws {
    try self.init(data: try Data(contentsOf: url))
  }
  
  func with(
    uniID: String?? = nil,
    pollDivCo: String?? = nil,
    gpollDivCo: String?? = nil,
    osNm: String?? = nil,
    vanAdr: String?? = nil,
    newAdr: String?? = nil,
    tel: String?? = nil,
    siguncd: String?? = nil,
    lpgYn: String?? = nil,
    maintYn: String?? = nil,
    carWashYn: String?? = nil,
    kpetroYn: String?? = nil,
    cvsYn: String?? = nil,
    gisXCoor: Double?? = nil,
    gisYCoor: Double?? = nil,
    oilPrice: [OilPrice]?? = nil
    ) -> Oil {
    return Oil(
      uniID: uniID ?? self.uniID,
      pollDivCo: pollDivCo ?? self.pollDivCo,
      gpollDivCo: gpollDivCo ?? self.gpollDivCo,
      osNm: osNm ?? self.osNm,
      vanAdr: vanAdr ?? self.vanAdr,
      newAdr: newAdr ?? self.newAdr,
      tel: tel ?? self.tel,
      siguncd: siguncd ?? self.siguncd,
      lpgYn: lpgYn ?? self.lpgYn,
      maintYn: maintYn ?? self.maintYn,
      carWashYn: carWashYn ?? self.carWashYn,
      kpetroYn: kpetroYn ?? self.kpetroYn,
      cvsYn: cvsYn ?? self.cvsYn,
      gisXCoor: gisXCoor ?? self.gisXCoor,
      gisYCoor: gisYCoor ?? self.gisYCoor,
      oilPrice: oilPrice ?? self.oilPrice
    )
  }
  
  func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }
  
  func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
  }
}

extension OilPrice {
  init(data: Data) throws {
    self = try newJSONDecoder().decode(OilPrice.self, from: data)
  }
  
  init(_ json: String, using encoding: String.Encoding = .utf8) throws {
    guard let data = json.data(using: encoding) else {
      throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
    }
    try self.init(data: data)
  }
  
  init(fromURL url: URL) throws {
    try self.init(data: try Data(contentsOf: url))
  }
  
  func with(
    prodcd: String?? = nil,
    price: Int?? = nil,
    tradeDt: String?? = nil,
    tradeTm: String?? = nil
    ) -> OilPrice {
    return OilPrice(
      prodcd: prodcd ?? self.prodcd,
      price: price ?? self.price,
      tradeDt: tradeDt ?? self.tradeDt,
      tradeTm: tradeTm ?? self.tradeTm
    )
  }
  
  func jsonData() throws -> Data {
    return try newJSONEncoder().encode(self)
  }
  
  func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
    return String(data: try self.jsonData(), encoding: encoding)
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

//// MARK: - URLSession response handlers
//
//extension URLSession {
//  fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
//    return self.dataTask(with: url) { data, response, error in
//      guard let data = data, error == nil else {
//        completionHandler(nil, response, error)
//        return
//      }
//      completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
//    }
//  }
//
//  func detailByIDTask(with url: URL, completionHandler: @escaping (DetailByID?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
//    return self.codableTask(with: url, completionHandler: completionHandler)
//  }
//}
