import UIKit

struct DetailById: Decodable {
  let result: DetailByIdResult

  enum CodingKeys: String, CodingKey {
    case result = "RESULT"
  }
}

struct DetailByIdResult: Decodable {
  var oil: [DetailByIdOil]
  enum CodingKeys: String, CodingKey {
    case oil = "OIL"
  }
}

struct DetailByIdOil: Decodable {
  let uniId: String
  let pollDivCompany: String//PollDivCompany
  let gpollDivCompany: String//PollDivCompany
  let oilStationName: String
  let vanAddress: String
  let newAddress: String
  let tel: String
  let sigunCode: String
  let lpgYN: String//LpgYN
  let maintenanceYN: String//MaintenanceYN
  let carWashYN: String//CarWashYN
  let kpetroYN: String//KpetroYN
  let cvsYN: String//CvsYN
  let gisXCoordinate: Double
  let gisYCoordinate: Double
  var oilPrice: [DetailByIdOilPrice]?

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
    case oilPrice = "OIL_PRICE"
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


let jsonString = """
{"RESULT":
{"OIL":[
{"UNI_ID":"A0006269",
"POLL_DIV_CO":"SOL",
"GPOLL_DIV_CO":"   ",
"OS_NM":"신화상사(주)주원고개주유소",
"VAN_ADR":"인천 남동구 간석동 527-4",
"NEW_ADR":"인천 남동구 주안로 264 (간석동)",
"TEL":"032-422-5182",
"SIGUNCD":"1506",
"LPG_YN":"N",
"MAINT_YN":"N",
"CAR_WASH_YN":"Y",
"KPETRO_YN":"N",
"CVS_YN":"N",
"GIS_X_COOR":285119.00780,
"GIS_Y_COOR":540878.30060,
"OIL_PRICE":[ {"PRODCD":"B027","PRICE":1315,"TRADE_DT":"20190320","TRADE_TM":"105824"},
{"PRODCD":"C004","PRICE":1050,"TRADE_DT":"20190320","TRADE_TM":"103249"},
{"PRODCD":"D047","PRICE":1227,"TRADE_DT":"20190320","TRADE_TM":"102415"}
]
}
]
}
}
"""

let decoder = JSONDecoder()
let data = Data(String(jsonString))
decoder.decode(DetailById.self, from: data)
