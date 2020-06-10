//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Sunmi on 2020/06/04.
//  Copyright © 2020 CreativeSuns. All rights reserved.
//

import Foundation


enum CoronaDBCodingKeys: String, CodingKey {

       case resultCode
       case resultMessage
       case korea     = "korea"
       case seoul     = "seoul"
       case busan     = "busan"
       case daegu     = "daegu"
       case incheon   = "incheon"
       case gwangju   = "gwangju"
       case daejeon   = "daejeon"
       case ulsan     = "ulsan"
       case sejong    = "sejong"
       case gyeonggi  = "gyeonggi"
       case gangwon   = "gangwon"
       case chungbuk  = "chungbuk"
       case chungnam  = "chungnam"
       case jeonbuk   = "jeonbuk"
       case jeonnam   = "jeonnam"
       case gyeongbuk = "gyeongbuk"
       case gyeongnam = "gyeongnam"
       case jeju      = "jeju"
       case quarantine = "quarantine"
   // case menuGroups = "menuGroups"
}



class NetworkManager {
    static let shared = NetworkManager()
    let baseURL       = "https://api.corona-19.kr/korea/country/new"
    


    //다른 클래스에서 공유하지 않기 위해
    //private 선언
    private init() {}
    
    // return : [Follower]
    func getCoronaData(completed: @escaping (Result<[SimpleCoronaModel], GFError>) -> Void) {
        let endpoint = baseURL
    
        var coronaArray = Array<SimpleCoronaModel>()
        // background thread
        guard let url = URL(string: endpoint) else {
            
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let jsonData = data else {
                completed(.failure(.invalidData))
                return
            }
            
            
            do {
                
                let dict = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments)
                       guard let swiftDict = dict as? [String : Any] else {
                           print("Not a valid response")
                           return
                       }

                       for (key, value) in swiftDict {
            
                        if !key.contains("resultCode") || !key.contains("resultMessage") {
                            
                            if let parsedData = value as? [String: String] {
                                
                            let model = SimpleCoronaModel(countryName: parsedData["countryName"]!, newCase: parsedData["newCase"]!, totalCase: parsedData["totalCase"]!, recovered:  parsedData["recovered"]!, death: parsedData["death"]!, percentage: parsedData["percentage"]!, newFcase: parsedData["newFcase"]!, newCcase: parsedData["newCcase"]!)
                                coronaArray.append(model)
                                
                             }
                                
                          }
                            
                           
                        }
                        //resultMessage
                        
                        completed(.success(coronaArray))
                
            } catch {
                
                print(error.localizedDescription)
                 completed(.failure(.invalidData))
                //completed(nil,"The data received from the server was invalid. Please try again.")
            }
        }
        
        task.resume()
    }
    
    
   
}


