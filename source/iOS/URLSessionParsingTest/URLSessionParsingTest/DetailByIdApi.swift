//
//  DetailByIdApi.swift
//  URLSessionParsingTest
//
//  Created by dave76 on 19/03/2019.
//  Copyright © 2019 dave76. All rights reserved.
//

import Foundation

class DetailByIdApi {
  
  let jsonString = """
{"RESULT":

{"OIL":[

      

 

{"UNI_ID":"A0000826","POLL_DIV_CO":"RTO","GPOLL_DIV_CO":"   ","OS_NM":"JHC에너지","VAN_ADR":"서울 구로구 구로동 1126-17","NEW_ADR":"서울특별시 구로구  시흥대로 539 (구로동)","TEL":"02-866-9553","SIGUNCD":"0116","LPG_YN":"N","MAINT_YN":"Y","CAR_WASH_YN":"N","KPETRO_YN":"N","CVS_YN":"N","GIS_X_COOR":302894.00000,"GIS_Y_COOR":542720.00000,"OIL_PRICE":[

         

{"PRODCD":"B027","PRICE":1365,"TRADE_DT":"20190319","TRADE_TM":"144927"},

                    

    

            

{"PRODCD":"C004","PRICE":1050,"TRADE_DT":"20190318","TRADE_TM":"235414"},

                    

    

            

{"PRODCD":"D047","PRICE":1255,"TRADE_DT":"20190319","TRADE_TM":"145910

       "}

    

       

       

       

    

    ]}

                                      

                                              

]} }



"""
  
  func detailById(uniId: String, completion: @escaping DetailByIdResponseCompletion) {
    let urlString = DETAIL_BY_ID + QUERY_OUT_JSON_AND_OPINET_CODE + "&id=\(uniId)"
    guard let url = URL(string: urlString) else { return }
    //print("\n================[\(url)]================\n")
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard error == nil else {
        debugPrint(error.debugDescription)
        completion(nil)
        return
      }
      guard let data = data else { return }
      print(String(data: data, encoding: .utf8))
      let jsonDecoder = JSONDecoder()
      do {
        var detailById = try jsonDecoder.decode(DetailById.self, from: data)
        print("----> \(detailById.result.oil)")
        completion(detailById)
      } catch {
        print("\n================[error catch]================\n")
        debugPrint(error.localizedDescription)
        completion(nil)
      }
    }
    task.resume()
  }
  
  func detailById(uniId: String) {
    let urlString = DETAIL_BY_ID + QUERY_OUT_JSON_AND_OPINET_CODE + "&id=\(uniId)"
    guard let url = URL(string: urlString) else { return }
    //print("\n================[\(url)]================\n")
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard error == nil else {
        debugPrint(error.debugDescription)
//        completion(nil)
        return
      }
      guard let data = data else { return }
      print(String(data: data, encoding: .utf8))
      let jsonDecoder = JSONDecoder()
      do {
        let detailById = try jsonDecoder.decode(DetailById.self, from: data)
        print("----> \(detailById.result.oil)")
//        completion(detailById)
      } catch {
        print("\n================[error catch]================\n")
        debugPrint(error.localizedDescription)
//        completion(nil)
      }
    }
    task.resume()
  }

}
