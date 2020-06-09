//
//  CityCoronaModel.swift
//  Corona19Demo
//
//  Created by Sunmi on 2020/06/09.
//  Copyright © 2020 sun. All rights reserved.
//

import Foundation


//
//struct StoreData: Codable {
//
//    enum CodingKeys: String, CodingKey {
//        case storeState = "state"
//        case storeInfo = "info"
//        case storeSettings = "setting"
//        case advertisement = "advertisement"
//        case states = "stats"
//        case dataOfUserLikes = "likeUsers"
//        case menuGroups = "menuGroups"
//        case isDeleted =  "isDeleted"
//        case id = "_id"
//        case createAt = "createdAt"
//        case updateAt = "updatedAt"
//        case owner = "owner"
//
//    }
//    var storeState: StoreState
//    var storeInfo: StoreInfo
//    var storeSettings: StoreSettings
//    var advertisement: Advertisement
//    var states: Stats
//    var dataOfUserLikes: [UserLikes]
//    var menuGroups: [MenuGroups]
//    var isDeleted: Bool
//    var id: String?
//    var createAt: String?
//    var updateAt: String?
//    var owner: String?
//
//}

struct CityCoronaModel: Codable {
    
    var resultCode: String
    var resultMessage: String
    var korea: String
    var seoul: String
    var busan: String
    var daegu: String
    var incheon: String
    var gwangju: String
    var daejeon: String
    var ulsan: String
    var sejong: String
    var gyeonggi: String
    var gangwon: String
    var chungbuk: String
    var chungnam: String
    var jeonbuk: String
    var jeonnam: String
    var gyeongbuk: String
    var gyeongnam: String
    var jeju: String
    var
    
    
    
    enum CodingKeys: String, CodingKey {
        case resultCode
        case resultMessage
        case korea
        
        
        
    }
    
}

struct KoreaData: Codable {
   var countryName: String
   var newCase: String
   var totalCase: String
   var recovered: String
   var death: String
   var percentage: String
   var newFcase: String
   var newCcase: String
}

// MARK: - Seoul
struct Seoul: Codable {
   var countryName: String
   var newCase: String
   var totalCase: String
   var recovered: String
   var death: String
   var percentage: String
   var newFcase: String
   var newCcase: String
}

// MARK: - Busan
struct Busan: Codable {
   var countryName: String
   var newCase: String
   var totalCase: String
   var recovered: String
   var death: String
   var percentage: String
   var newFcase: String
   var newCcase: String
}

// MARK: - Daegu
struct Daegu: Codable {
   var countryName: String
   var newCase: String
   var totalCase: String
   var recovered: String
   var death: String
   var percentage: String
   var newFcase: String
   var newCcase: String
}


// MARK: - Incheon
struct Incheon: Codable {
   var countryName: String
   var newCase: String
   var totalCase: String
   var recovered: String
   var death: String
   var percentage: String
   var newFcase: String
   var newCcase: String
}

// MARK: - Gwangju
struct Gwangju: Codable {
   var countryName: String
   var newCase: String
   var totalCase: String
   var recovered: String
   var death: String
   var percentage: String
   var newFcase: String
   var newCcase: String
}

// MARK: - Daejeon
struct Daejeon: Codable {
   var countryName: String
   var newCase: String
   var totalCase: String
   var recovered: String
   var death: String
   var percentage: String
   var newFcase: String
   var newCcase: String
}
